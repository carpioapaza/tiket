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
  end

  def create
    @event = current_user.events.build(event_params)
    @event.admin_status = :pending_approval

    if @event.save
      redirect_to users_event_path(@event), notice: 'Event created successfully. Waiting for approval.'
    else
      render :new
    end
  end

  def edit
  @event = Event.find(params[:id])
  @event.build_location if @event.location.nil?
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
    params.require(:event).permit(:name, :description, :start_datetime, :end_datetime, :visibility, :restriction, :capacity, :video_url,
                                  location_attributes: [:city, :address, :reference]) 
  end
end

    