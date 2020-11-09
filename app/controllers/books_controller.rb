class BooksController < ApplicationController
  before_action :ensure_correct_user, only:[:edit] # 編集画面へのアクセス制限
  
  def create
    @book = Book.new(book_params) # 投稿データを取得
    @book.user_id = current_user.id # Bookモデルのuser_idカラムに現在ログインしているユーザーのidを取得
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book) # 投稿詳細ページにリダイレクト
    else
      @books = Book.all # 投稿一覧を表示
      @user = current_user # 部分テンプレートのマイページを表示するため
      render 'books/index'
    end
  end
  
  def index
    @book = Book.new # 投稿フォーム用に空のインスタンスを渡す
    @books = Book.all
    @user = current_user # 部分テンプレートのマイページを表示するため
  end

  def show
    @user = current_user # 投稿詳細ページのユーザー画像と名前を表示するために必要
    @book_new = Book.new # 投稿フォーム用に空のインスタンスを渡す
    # ↑@bookにすると、その後find(params[:id])で値が取得されてしまいform_withがupdateになるためインスタンス名を値を取得するものとは別にする
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path #投稿一覧ページにリダイレクト
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_correct_user #投稿したユーザーと現在ログインしているユーザーを比較するメソッド
    @book = Book.find(params[:id]) #投稿を取得
    unless @book.user == current_user #投稿したユーザーが現在ログインしているユーザーではない場合
      redirect_to books_path #投稿一覧画面にリダイレクト
    end
  end
end