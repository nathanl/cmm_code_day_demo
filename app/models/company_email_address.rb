class CompanyEmailAddress < ActiveRecord::Base
  belongs_to :company
  validates :company, :address, presence: true
end
