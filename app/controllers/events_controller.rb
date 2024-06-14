class EventsController < ApplicationController
   def index
    @events = Event.all
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
        # Manejar el caso en el que no se encuentra ninguna ciudad ni categoría con el nombre proporcionado
      end
    end

end
