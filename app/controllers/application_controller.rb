class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id) # ログイン後はマイページ（現在ログインしているユーザーのページに
  end

  protected # ストロングパラメータ（他のコントローラも参照可）

  def configure_permitted_parameters # sign up,sign画面で追加したnameデータの操作許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end