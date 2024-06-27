class SuperAdmins::DashboardController < SuperAdminController
  def index
    @events_by_category = Category.joins(:events)
                                  .select('categories.name AS category_name, COUNT(events.id) AS event_count')
                                  .group('categories.name')
                                  .order('event_count DESC')
    @chart_data = {
      labels: @events_by_category.map(&:category_name),
      data: @events_by_category.map(&:event_count)
    }

    @events = Event.includes(:category, :city).all
    @categories = Category.all
    @cities = City.all

      @latest_events = Event.order(created_at: :desc).limit(5) 
      @latest_users = User.order(created_at: :desc).limit(5)   
  end
end
