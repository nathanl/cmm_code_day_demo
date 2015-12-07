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
    @entry = find_entry_for_current_user
  end

  def update
    @entry = find_entry_for_current_user
    @entry.attributes = entry_params
    if @entry.save
      redirect_to company_project_task_entry_path(id: @entry)
    else
      flash[:error] = @entry.errors.full_messages.to_sentence
      render :edit
    end
  end

  def start_timer
    @entry = find_entry_for_current_user
    @entry.start_timer
    @entry.save
    redirect_to company_project_task_entry_path(id: @entry)
  end

  def stop_timer
    @entry = find_entry_for_current_user
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

  def find_entry_for_current_user
    current_user.entries.find(params[:id])
  end

end
