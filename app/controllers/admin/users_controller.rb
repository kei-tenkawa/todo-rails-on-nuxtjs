class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_department, only: %i[show edit new]
  def new
    @user = User.new
    @sections = Department.first.sections
  end

  def edit; end

  def show; end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を追加しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザ「#{@user.name}」を削除しました。"
  end

  def sections
    @sections = Section.where(department_id: params[:id])
  end

  private

  def user_params
    # 　必要なやつだけ取ってくる
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :department_id, :section_id)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_department
    @departments = Department.all
  end
end
