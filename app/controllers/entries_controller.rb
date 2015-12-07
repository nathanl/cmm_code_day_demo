class EntriesController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @entry = @task.entries.build(user: current_user)
  end

  def create
    @task      = Task.find(params[:task_id])
    @entry  = @task.entries.build
    @entry.user = current_user
    @entry.attributes = entry_params
    if @entry.save
      redirect_to company_project_task_entry_path(id: @entry)
    else
      flash[:error] = @entry.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def index
    @task      = Task.find(params[:task_id])
    @entries   = @task.entries
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.attributes = entry_params
    if @entry.save
      redirect_to company_project_task_entry_path(id: @entry)
    else
      flash[:error] = @entry.errors.full_messages.to_sentence
      render :edit
    end
  end

  def start_timer
    @entry = Entry.find(params[:id])
    @entry.start_timer
    @entry.save
    redirect_to company_project_task_entry_path(id: @entry)
  end

  def stop_timer
    @entry = Entry.find(params[:id])
    @entry.stop_timer
    @entry.save
    redirect_to company_project_task_entry_path(id: @entry)
  end

  private

  def entry_params
    params.require(:entry).permit(
      :date, :description, :duration_in_minutes, :active_timer_start
    )
  end

end
