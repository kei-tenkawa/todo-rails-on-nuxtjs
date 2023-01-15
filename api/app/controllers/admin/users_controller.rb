class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: %i[show edit update destroy]

  def new
    user = User.new
    render status: :ok, json: user
  end

  def edit; end

  def show; end

  def index
    users = User.all
    render status: :ok, json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: :ok, json: user
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  def update
    if user.update(user_params)
      render status: :ok, json: user
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  def destroy
    if user.destroy
      render status: :ok
    else
      render status: 500, json: { message: 'Internal Server Error' }
    end
  end

  private

  def user_params
    # 　必要なやつだけ取ってくる
    params.permit(:name, :email, :admin, :password, :password_confirmation, :department_id, :section_id)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

  def set_user
    user = User.find(params[:id])
  end
end
