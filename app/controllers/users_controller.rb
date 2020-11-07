class UsersController < ApplicationController
  
  def create
  end

  def index
  end

  def show
    @user = User.find(params[:id]) # ユーザーのデータを1件取得
    @book = @user.book # @userに関連付けられた投稿(.book)のみ取得(全体の投稿ではなく個人が投稿したもののみ)
  end
  
  def edit
    @user = User.find(params[:id]) 
  end

  def update
  end
  
  def destroy
  end

end
