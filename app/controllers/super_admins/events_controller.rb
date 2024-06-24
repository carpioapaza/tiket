# app/controllers/super_admins/events_controller.rb
class SuperAdmins::EventsController < ApplicationController
  # ...
  def index
    @events = Event.all
  end
  

  private

  def event_params
    params.require(:event).permit(:admin_status) 
  end
end
