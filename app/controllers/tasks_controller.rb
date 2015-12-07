class TasksController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to company_project_tasks_path(project_id: @project.id)
    else
      flash[:error] = @task.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def show
    @task = Task.find(params[:id])
    @entries = @task.entries
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end
