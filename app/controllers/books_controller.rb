class BooksController < ApplicationController
  
  def new
  end

  def create
    @book = Book.new(book_params) # 投稿データを取得
    @book.user_id = current_user.id # Bookモデルのuser_idカラムに現在ログインしているユーザーのidを取得
    @book.save
    redirect_to book_path(@book) # 投稿詳細ページにリダイレクト
  end

  def index
    @book = Book.new # 投稿フォーム用に空のインスタンスを渡す
    @books = Book.all
  end

  def show
    @book_new = Book.new # 投稿フォーム用に空のインスタンスを渡す
    # ↑@bookにすると、その後find(params[:id])で値が取得されてしまいform_withがupdateになるためインスタンス名を値を取得するものとは別にする
    @book = Book.find(params[:id])
  end
  
  def edit
  end

  def update
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
end
