class CompanyPhoneNumber < ActiveRecord::Base
  belongs_to :company
  validates :company, :number, :number_type, presence: true

  # TODO: validate number_type is either "phone" or "fax"
end
