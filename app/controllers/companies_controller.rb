class CompaniesController < ApplicationController

  def index
    @companies = Company.order(:name).all
  end

end
