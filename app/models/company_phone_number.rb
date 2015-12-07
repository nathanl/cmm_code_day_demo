class CompanyPhoneNumber < ActiveRecord::Base
  validates :company, :number, :type, presence: true

  # TODO: validate type is either "phone" or "fax"
end
