class TaskTypesController < ApplicationController
  before_action :set_task_type, only: %i[show edit update destroy]
  def index
    task_types = TaskType.all
    render status: :ok, json: task_types
  end

  def show; end

  def new
    task_type = TaskType.new
    render status: :ok, json: task_type
  end

  def edit; end

  def create
    task_type = TaskType.new(task_type_params)
    if task_type.save
      render status: :ok, json: task_type
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  def update
    if task_type.update(task_type_params)
      render status: :ok, json: task_type
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  def destroy
    if task_type.destroy
      render status: :ok
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  private

  def task_type_params
    params.permit(:name)
  end

  def set_task_type
    @task_type = TaskType.find(params[:id])
  end
end
