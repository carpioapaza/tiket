# app/jobs/generate_report_job.rb

class GenerateReportJob < ApplicationJob
  queue_as :default

  def perform
    pdf = generate_pdf
    save_pdf(pdf)
  end

  private

  def generate_pdf
    pdf = Prawn::Document.new
    pdf.text "Informe Resumen General", size: 24, style: :bold, align: :center

    # Sección de Resumen
    pdf.move_down 20
    pdf.text "Resumen", size: 18, style: :bold
    pdf.move_down 10
    pdf.text "Total de Eventos: #{Event.count}"
    pdf.text "Total de Categorías: #{Category.count}"
    pdf.text "Total de Ciudades: #{City.count}"

    pdf.move_down 20
    pdf.text "Desglose de Eventos por Categoría", size: 18, style: :bold
    category_data = Category.joins(:events).group(:name).count
    pdf.table(category_data.map { |category, count| [category, count] }, header: true, row_colors: ['dddddd', 'ffffff'])

    pdf.move_down 20
    pdf.text "Detalles de Eventos", size: 18, style: :bold
    event_data = [["Nombre", "Descripción", "Fecha de Inicio", "Fecha de Fin", "Categoría", "Ciudad", "User"]]
    Event.includes(:category, :city, :user).each do |event|
      event_data << [event.name, event.description, event.start_datetime.to_s, event.end_datetime.to_s, event.category.name, event.city.name, event.user.email || event.user.name]
    end
    pdf.table(event_data, header: true, row_colors: ['dddddd', 'ffffff'])

    pdf.move_down 20
    pdf.text "Ventas de Entradas", size: 18, style: :bold
    ticket_data = [["Evento", "Nombre de la Entrada", "Cantidad Vendida", "Ingresos Totales"]]
    Event.includes(tickets: :ticket_purchases).each do |event|
      event.tickets.each do |ticket|
        ticket_data << [event.name, ticket.ticket_name, ticket.ticket_purchases.sum(:quantity), ticket.ticket_purchases.sum(:subtotal)]
      end
    end
    pdf.table(ticket_data, header: true, row_colors: ['dddddd', 'ffffff'])

    # Pie de Página
    pdf.number_pages "Página <page> de <total>", at: [pdf.bounds.right - 50, 0], align: :right
    pdf.render
  end

  def save_pdf(pdf_data)
    File.open(Rails.root.join('public', 'general_summary.pdf'), 'wb') do |file|
      file << pdf_data
    end
  end
end
