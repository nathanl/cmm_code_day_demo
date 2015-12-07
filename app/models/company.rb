class Company < ActiveRecord::Base

  has_many :addresses, dependent: :destroy, class_name: "CompanyAddress"
  has_many :phone_numbers, dependent: :destroy, class_name: "CompanyPhoneNumber"
  has_many :email_addresses, dependent: :destroy, class_name: "CompanyEmailAddress"

  has_many :projects, class_name: "Project"

  validates :name, presence: true

  def duration_in_minutes
    projects.map(&:duration_in_minutes).reduce(0, &:+)
  end

end
