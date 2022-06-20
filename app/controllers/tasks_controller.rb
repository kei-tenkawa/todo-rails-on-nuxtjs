class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])  # ソート
    @task_types = TaskType.all

    respond_to do |format|
      format.html
      format.csv { send_data @tasks.generate_csv, filename: "task-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show; end

  def new
    @task = Task.new
    @task_types = TaskType.all
  end

  def edit; end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if params[:back].present?
      render :new
      return
    end
    if @task.save
      # TaskMailer.creation_email(@task).deliver_now
      # SampleJob.perform_later
      redirect_to @task, notice: "タスク「#{@task.name}]を登録しました。"
    else
      render :new
    end
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def import
    current_user.tasks.import(params[:file])
    redirect_to tasks_url, notice: 'タスクを追加しました'
  end

  private

  def task_params
    params.require(:task).permit(:name, :task_type_id, :status, :description, :image)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
    @task_types = TaskType.all
  end
end
