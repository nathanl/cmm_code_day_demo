class Entry < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates :task, :user, :date, :description, :duration_in_minutes, presence: true
  validate :duration_not_negative

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

end
