class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_event, only: [:show, :edit, :update]
before_action :check_role
  def index
    @events = current_admin.events
  end

  def show
  end

  def edit
  end
  def update
      if event_params[:admin_status] == 'deleted'
        if @event.destroy
          redirect_to admins_events_path, notice: 'Evento eliminado correctamente.'
        else
          render :edit, alert: 'Error al eliminar este evento'
        end
      elsif @event.update(event_params)
        redirect_to admins_event_path(@event), notice: 'Evento actualizado correctamente.'
      else
        render :edit
      end
    end

  private

  def set_event
    @event = current_admin.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:admin_status)
  end

  def check_role
    unless current_admin.event_admin?
      redirect_to root_path, alert: "Andá pa allá bobo!, no tienes permisos para acceder ahí ;)"
    end
  end
  
end
