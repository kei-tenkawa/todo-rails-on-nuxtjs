class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    tasks = Task.all
    render json: tasks
  end

  def show; end

  def new
    task = Task.new
    render status: :ok, json: { message: 'success', data: tasks, errors: [] }
  end

  def edit; end

  def create
    task = Task.new(task_params.merge(user_id: current_user.id))
    if task.save
      # TaskMailer.creation_email(@task).deliver_now
      # SampleJob.perform_later
      render status: :ok, json: task
    else
      render status: 500, json: { message: 'error', data: nil, errors: ['Internal Server Error'] }
    end
  end

  def update
    if task.update!(task_params)
      render status: :ok, json: task
    else
      render status: 500, json: { message: 'error', data: nil, errors: ['Internal Server Error'] }
    end
  end

  def destroy
    if @task.destroy
      render status: :ok
    else
      render status: 500, json: { message: 'error', data: nil, errors: ['Internal Server Error'] }
    end
  end

  # def import
  #   current_user.tasks.import(params[:file])
  #   redirect_to tasks_url, notice: 'タスクを追加しました'
  # end

  private

  def task_params
    params.permit(:name, :task_type_id, :status, :description, :image)
  end

  # taskを取得する
  def set_task
    task = current_user.tasks.find(params[:id])
  end
end
