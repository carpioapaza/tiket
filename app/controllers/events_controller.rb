class EventsController < ApplicationController
   def index
    @events = Event.includes(:tickets)

    # render template: 'home/events/index_all'
  end
  def show
    @event = Event.find(params[:id])
  end

  def index_by_filter
      filter = params[:filter]
      if City.exists?(name: filter)
        @events = City.find_by(name: filter).events
      elsif Category.exists?(name: filter)
        @events = Category.find_by(name: filter).events
      else
      end
    end

end
