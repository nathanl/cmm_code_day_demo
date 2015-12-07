module ApplicationHelper

  def human_duration(minutes)
    "#{minutes} min (#{(minutes / 60.0).round(2)} hrs)"
  end

  def human_boolean(bool)
    bool ? "Yes" : "No"
  end

end
