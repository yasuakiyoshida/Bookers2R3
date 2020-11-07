class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(@user) # ログイン後はユーザー詳細ページに
  end

  protected # ストロングパラメータ（他のコントローラも参照可）

  def configure_permitted_parameters # sign up画面で追加したnameデータの操作許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
