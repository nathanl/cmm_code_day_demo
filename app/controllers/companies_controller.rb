class CompaniesController < ApplicationController

  def index
    @companies = Company.order(:name).includes(projects: {tasks: :entries}).all
  end

end
