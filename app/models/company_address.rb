class CompanyAddress < ActiveRecord::Base
  validates :company, :line_1, :city, :state, :zip, null: false
end
