class Project < ActiveRecord::Base
  belongs_to :company
  has_many :tasks

  def duration_in_minutes
    tasks.map(&:duration_in_minutes).reduce(0, &:+)
  end

end
