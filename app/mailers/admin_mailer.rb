class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_event_notification.subject
  #
  def new_event_notification(event, admin)
    @event = event
    @admin = admin
    @greeting = "Hola" # Puedes personalizar el saludo aquí
    mail(to: @admin.email, subject: "Nuevo evento creado: #{@event.name}")
  end
end
