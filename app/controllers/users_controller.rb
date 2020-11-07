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
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id) # ユーザー詳細ページにリダイレクト
  end
  
  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
