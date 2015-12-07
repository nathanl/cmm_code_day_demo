class CompanyAddress < ActiveRecord::Base
  belongs_to :company
  validates :company, :line_1, presence: true
end
