class Company < ActiveRecord::Base

  validates :name, presence: true
  has_many :addresses, dependent: :destroy, class_name: "CompanyAddress"
  has_many :phone_numbers, dependent: :destroy, class_name: "CompanyPhoneNumber"
  has_many :email_addresses, dependent: :destroy, class_name: "CompanyEmailAddress"

end
