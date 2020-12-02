class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id]) # パラメータ(book_id)で指定された投稿を検索して、変数に格納
    comment = current_user.book_comments.new(book_comment_params) # comment = BookComment.new(book_comment_params) \ comment.user_id = current.user.idと同じ -->
    # comment = BookComment.new(book_comment_params) # コメントを生成
    # comment.user_id = current.user.id # 生成したコメントのユーザーIDにコメント投稿者のIDを設定
    comment.book_id = book.id # 生成したコメントの投稿(book)IDにパラメータで渡された投稿IDを設定
    comment.save
    redirect_to book_path(book) # 投稿詳細画面にリダイレクト
  end
  
  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy # パラメータ(id,book_id)で指定されたコメントと投稿を検索して削除(URLにidが2つ)
    redirect_back fallback_location: @book.id
  end
  
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
