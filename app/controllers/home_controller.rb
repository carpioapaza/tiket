class HomeController < ApplicationController
   def index
    @events = Event.all
    # render template: 'home/events/index_all'
  end
end
