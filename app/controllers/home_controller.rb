class HomeController < ApplicationController
   def index_all
    @events = Event.all
    render template: 'home/events/index_all'
  end
end
