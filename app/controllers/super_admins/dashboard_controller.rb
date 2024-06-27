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
  end
end
