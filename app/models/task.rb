class Task < ActiveRecord::Base
  belongs_to :project
  has_many :entries, class_name: "Entry"

  validates :name, presence: true
end
