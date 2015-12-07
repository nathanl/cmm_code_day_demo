class ProjectsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @projects = @company.projects
  end

  def new
    @project = Project.new(company_id: params[:company_id])
  end

  def create
    company = Company.find(params[:company_id])
    @project = company.projects.build(project_params)
    if @project.save
      redirect_to company_projects_path
    else
      flash[:error] = @project.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def edit
    company = Company.find(params[:company_id])
    @project = company.projects.find(params[:project_id])
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
