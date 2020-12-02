class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id]) # パラメータ(book_id)で指定された投稿を検索して、変数に格納
    comment = BookComment.new(book_comment_params) # commentカラム情報取得
    comment.user_id = current_user.id # user_idカラム情報取得
    comment.book_id = book.id # book_idカラム情報取得
    comment.save # book_comment情報揃ったのでセーブ
    redirect_to book_path(book)
  end
  
  def destroy
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.destroy
    redirect_to book_path(params[:book_id])
  end
  
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
