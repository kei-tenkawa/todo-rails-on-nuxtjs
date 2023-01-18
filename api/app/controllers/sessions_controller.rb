class SessionsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :verify_authenticity_token, only: :create
  after_action :set_csrf_token_header, only: [:create, :show]

  def new
    render status: :ok, json: { message: "success" }
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      # TODO: ログイン状態を保持する
      # cookies.permanent.signed[:user_id] = user.id
      # cookies.permanent[:remember_token] = user.remember_token
      payload = { message: 'ログインしました。', data: user, errors: [] }
    else
      payload = { message: 'ログインに失敗しました。', data: nil, errors: ["メールアドレスまたはパスワードが正しくありません"] }
    end
    render status: :ok, json: payload
  end

  def destroy
    reset_session
    render status: :ok, json: { message: 'ログアウトしました' }
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
