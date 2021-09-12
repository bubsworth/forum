# frozen_string_literal: true

module DateHelper
  def formatted_date(date)
    date.strftime("%-d %b %Y") if date.present?
  end

  def analytic_time(time)
    time.try(:strftime, "%d-%m-%y %H:%M")
  end
end
