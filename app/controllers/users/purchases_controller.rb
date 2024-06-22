class Users::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @purchase = current_user.purchases.new(event: @event, total_amount: calculate_total_amount, payment_status: 'pending')

    ActiveRecord::Base.transaction do
      if @purchase.save
        create_ticket_purchases
        redirect_to users_purchase_path(@purchase), notice: 'Compra creada con éxito';
      else
        redirect_to event_path(@event), alert: 'No se ha podido crear la compra'
      end
    end
  rescue => e
    redirect_to event_path(@event), alert: 'No se ha podido crear la compra #{e.message}'
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
  end

  private

  def purchase_params
    params.permit(:event_id, tickets: {})
  end

  def calculate_total_amount
    total = 0
    params[:tickets].to_unsafe_h.each do |ticket_id, quantity|
      ticket = Ticket.find(ticket_id)
      total += ticket.price * quantity.to_i
    end
    total
  end

  def create_ticket_purchases
    params[:tickets].to_unsafe_h.each do |ticket_id, quantity|
      next if quantity.to_i <= 0

      begin
        ticket = Ticket.find(ticket_id)
      rescue ActiveRecord::RecordNotFound
        redirect_to event_path(@event), alert: "Entrada no encontrada."
        return
      end

      if quantity.to_i > ticket.quantity_available
        redirect_to event_path(@event), alert: 'No hay entradas suficientes para: #{ticket.ticket_name}.'
        return
      end

      unless ticket.event_id == @event.id
        redirect_to event_path(@event), alert: "Invalid ticket selection."
        return
      end

      @purchase.ticket_purchases.create(ticket: ticket, quantity: quantity, subtotal: ticket.price * quantity.to_i)
    end
  end
end
