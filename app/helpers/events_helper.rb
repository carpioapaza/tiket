module EventsHelper
  def event_status_class(status)
    case status
    when "pending_approval"
      "badge bg-warning"
    when "approved"
      "badge bg-success"
    when "rejected"
      "badge bg-danger"
    when "deleted"
      "badge bg-secondary"
    else
      "badge bg-secondary"
    end
  end
end
