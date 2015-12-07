class Task < ActiveRecord::Base
  belongs_to :project
  has_many :entries, class_name: "Entry"

  validates :name, presence: true

  def duration_in_minutes
    entries.map(&:duration_in_minutes).reduce(0, &:+)
  end
end
