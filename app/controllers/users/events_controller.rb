class Users::EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end
  
  def show
  end

  def new
    @event = current_user.events.build
    @event.build_location
    @event.tickets.build
  end

  def create
    @event = current_user.events.build(event_params)
    @event.category_id = params[:event][:category_id]

    if @event.save
      # AdminMailer.new_event_notification(@event, @event.admin).deliver_now
      redirect_to users_event_path(@event), notice: 'Event created successfully. Waiting for approval.'
    else
      render :new
    end
  end

  def edit
    @event.build_location if @event.location.nil?
    @event.tickets.build if @event.tickets.empty?
  end

  def update
    if @event.update(event_params)
      redirect_to users_event_path(@event), notice: 'Event updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to users_events_path, notice: 'Event deleted successfully.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_datetime, :end_datetime, :visibility, :restriction, :capacity, :video_url, :image,
                                  :category_id, :city_id,
                                  location_attributes: [:address, :reference],
                                  tickets_attributes: [:id, :ticket_name, :quantity_available, :price, :currency, :_destroy])
  end
end
