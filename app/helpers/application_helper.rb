module ApplicationHelper

  def human_duration(minutes)
    "#{minutes} (#{(minutes / 60.0).round(2)} hours)"
  end

end
