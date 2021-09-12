module ApplicationHelper
  def notification_class(type)
    case type
    when "notice"
      "is-info"
    when "alert"
      "is-danger"
    end
  end

  def yes_or_no(bool)
    bool ? "Yes" : "No"
  end
end
