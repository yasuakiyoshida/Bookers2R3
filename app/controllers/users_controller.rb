class UsersController < ApplicationController
  before_action :correct_user, only: [:edit] # 編集画面へのアクセス制限
  
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
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) # ユーザー詳細ページにリダイレクト
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user #プロフィールのユーザーと現在ログインしているユーザーが一致しているか比較するメソッド
    @user = User.find(params[:id]) #ユーザーIDを取得
    unless @user == current_user #プロフィールのユーザーと現在ログインしているユーザーが異なる場合
      redirect_to user_path(current_user) #自分のプロフィール詳細へリダイレクト
    end
  end
end