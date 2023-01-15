class TaskTypesController < ApplicationController
  before_action :set_task_type, only: %i[show edit update destroy]
  def index
    @q = TaskType.all.ransack(params[:q])
    @task_types = @q.result(distinct: true).page(params[:page])  # ソート
  end

  def show; end

  def new
    @task_type = TaskType.new
  end

  def edit; end

  def create
    @task_type = TaskType.new(task_type_params)
    if params[:back].present?
      render :new
      return
    end
    if @task_type.save
      redirect_to @task_type, notice: "タスク「#{@task_type.name}]を登録しました。"
    else
      render :new
    end
  end

  def update
    if @task_type.update(task_type_params)
      redirect_to task_type_url(@task_type), notice: "タスクの種類「#{@task_type.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @task_type = TaskType.find(params[:id])
    @task_type.destroy
    redirect_to task_types_url, notice: "ユーザ「#{@task_type.name}」を削除しました。"
  end

  private

  def task_type_params
    params.require(:task_type).permit(:name)
  end

  def set_task_type
    @task_type = TaskType.find(params[:id])
  end
end
