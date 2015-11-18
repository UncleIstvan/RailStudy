class TasksController < ApplicationController

  before_filter :find_task, only: [:destroy, :show, :switch]

  # GET
  def index
    if params[:task_status]
      @tasks = Task.where(task_status:  params[:task_status])
    elsif params[:tasktype_id]
      @tasks = Task.where(tasktype_id:   params[:tasktype_id])
    else
      @tasks = Task.all
    end
  end

  # GET
  def new
    @task = Task.new
  end

  #POST FIND, not where
  def create
    @task = Task.create task_params
    redirect_to action: 'index'
  end

  def task_params
    params.require(:task).permit(:id, :name, :task_status, :tasktype_id, tasktypes_attributes: [:id, :name])
  end


  #DELETE
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

  #GET
  def show

  end

  def search

    @task = Task.where(id: params[:id]).first
    if @task
    render 'show'
    else
    redirect_to action: 'index'
      end
  end

  def pending
    @tasks = Task.where(:task_status => 'pending')
    render 'index'
  end

  def completed
    @tasks = Task.where(:task_status => 'completed')
    render 'index'
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
    @task = Task.where(id: params[:id]).first
  end


end
