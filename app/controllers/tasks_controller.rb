class TasksController < ApplicationController

  before_filter :find_task, only: [:destroy, :show, :switch, :search]

  def index
    if params[:task_status]
      @tasks = Task.where(task_status: params[:task_status])
    elsif params[:tasktype_id]
      @tasks = Task.where(tasktype_id: params[:tasktype_id])
    else
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create task_params
    redirect_to action: 'index'
  end

  def task_params
    params.require(:task).permit(:id, :name, :task_status, :tasktype_id, tasktypes_attributes: [:id, :name])
  end

  def destroy
    @task.destroy
    if @task.errors.empty?
      flash[:success] = "Task '#{@task.name}' was removed successfully "
      redirect_to action: 'index'
    else
      flash[:warning] = @task.errors.full_messages.to_sentence
      redirect_to action: 'index'
    end
  end

  def show

  end

  def search
    if @task
      render 'show'
    else
      flash[:warning] = "No task with that id was found "
      redirect_to action: 'index'
    end
  end

  def switch

    @task.update_attribute(:task_status, 'completed')
    if @task.errors.empty?
      flash[:success] = "Task  '#{@task.name}' was marked as complete"
      redirect_to action: 'index'
    else
      flash[:warning] = @task.errors.full_messages.to_sentence
      redirect_to action: 'index'
    end

  end

  private
  def find_task
    @task = Task.find_by(id: params[:id])
  end

end
