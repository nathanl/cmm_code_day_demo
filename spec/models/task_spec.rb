require "rails_helper"

describe Task do

  it "can give its total duration (for all entries)" do
    task  = Task.new
    task.entries.build(duration_in_minutes: 30)
    task.entries.build(duration_in_minutes: 15)
    task.entries.build(duration_in_minutes: 5)
    expect(task.duration_in_minutes).to eq(50)
  end

end
