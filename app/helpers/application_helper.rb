module ApplicationHelper

  def human_duration(minutes)
    "#{minutes} (#{(minutes / 60.0).round(2)} hours)"
  end

  def human_boolean(bool)
    bool ? "Yes" : "No"
  end

end
