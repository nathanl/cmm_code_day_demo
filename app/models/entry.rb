class Entry < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates :task, :user, :date, :description, :duration_in_minutes, presence: true
  validate :duration_not_negative

  def start_timer
    self.active_timer_start = Time.now
  end

  def stop_timer
    fail NoTimerRunning unless active_timer_start.present?
    self.duration_in_minutes += ((Time.now.to_time - active_timer_start.to_time) / 60.0)
    self.active_timer_start = nil
  end

  private

  def duration_not_negative
    if duration_in_minutes < 0
      errors.add(:duration_in_minutes, "can't be negative")
    end
  end

  # t.integer  "task_id",                         null: false
  # t.date     "date",                            null: false
  # t.string   "description"
  # t.integer  "duration_in_minutes", default: 0, null: false
  # t.datetime "active_timer_start"

  NoTimerRunning = Class.new(RuntimeError)
end
