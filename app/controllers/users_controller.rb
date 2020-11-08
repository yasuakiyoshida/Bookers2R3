class UsersController < ApplicationController
  
  def index
    @user = current_user # 部分テンプレートのマイページを表示するため
    @book = Book.new # フォーム用の空モデルを生成し、books_controllerのcreateアクションに渡す
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id]) # ユーザーのデータを1件取得
    @books = @user.books # ユーザー詳細画面でログインユーザーの投稿一覧を表示するために必要
    @book = Book.new # フォーム用の空モデルを生成し、books_controllerのcreateアクションに渡す
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