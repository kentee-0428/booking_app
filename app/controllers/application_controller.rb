class ApplicationController < ActionController::Base
  # アクションをroomコントローラーでも使用できるようにする
  before_action :set_search
  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # ransackクエリで検索
  def set_search
    @q = Room.ransack(params[:q])
  end

  def configure_permitted_parameters
    # 登録時に名前、メールアドレスを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    # ログイン時にメールアドレスを許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    # ログインユーザー編集時に名前、画像、紹介文を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation])
  end
end
