class ApplicationController < ActionController::API
  # Cookie使用
  include ActionController::Cookies
  # CSRF対策
  include ActionController::RequestForgeryProtection

  helper_method :current_user
  before_action :login_required

  # CSRF tokenの確認を有効にする
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    return if @current_user
    render json: { error: 'ログインしてください' }, status: :unauthorized
  end

  # CSRF対策: レスポンスヘッダに情報付与
  # - CSRF tokenを生成 & レスポンスヘッダ(X-CSRF-Token)にcsrf tokenを挿入
  # - form_authenticity_token: CSRF Token生成関数
  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end
end
