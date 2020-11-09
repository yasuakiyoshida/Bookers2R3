class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,except: [:top, :about] # ログインしていないユーザーがアクセスできるのはtopとaboutのみ
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id) # ログイン後はマイページ（現在ログインしているユーザーのページに
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id) # ログイン後に遷移するpathを設定
  end
  
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected # ストロングパラメータ（他のコントローラも参照可）

  def configure_permitted_parameters # sign up,sign in画面で追加したnameデータの操作許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) # emailも必要
  end
end