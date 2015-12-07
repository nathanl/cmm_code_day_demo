class CompanyEmailAddress < ActiveRecord::Base
  validates :company, :address, presence: true
end
