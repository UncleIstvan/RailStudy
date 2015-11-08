class TasksController < ApplicationController

  before_filter :find_task, only: [:edit, :update, :destroy, :show, :switch]

  # GET
  def index
    if params[:task_status]
      @tasks = Task.where(task_status:  params[:task_status])
    else
      @tasks = Task.all
    end
  end

  # GET
  def new
    @task = Task.new
  end

  #POST
  def create
    @task = Task.create task_params
    redirect_to action: 'index'
  end

  def task_params
    params.require(:task).permit(:id, :name, :task_status)
  end


  #DELETE
  def destroy
    @task.destroy
    redirect_to action: 'index'
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
    redirect_to action: 'index'
  end

  private
  def find_task
    @task = Task.where(id: params[:id]).first
  end




end
