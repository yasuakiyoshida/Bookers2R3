class UsersController < ApplicationController
  
  def create
  end

  def index
  end

  def show
    @user = User.find(params[:id]) # ユーザーのデータを1件
  end
  
  def edit
  end

  def update
  end
  
  def destroy
  end

end
