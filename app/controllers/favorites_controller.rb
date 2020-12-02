class FavoritesController < ApplicationController
  
  def create
    book = Book.find(params[:book_id]) # パラメータ(book_id)で指定された投稿(bookテーブル)を検索して、変数に格納
    favorite = current_user.favorites.new(book_id: book.id) # favorite = Favorite.new(book_id: book.id) \ current_user_id = current_user.idと同じ
    # favorite = Favorite.new(book_id: book.id) # 上で取得した投稿IDをbook_idカラムに格納し、favoriteインスタンスに渡す
    # current_user_id = current_user.id # 『いいね』したユーザー（ログインユーザー）のIDを取得
    favorite.save
    redirect_back fallback_location: @book # 直前の画面にリダイレクト
  end
  
  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id) # 生成したfavoriteモデルのインスタンスのuser_idカラムにcurrent_user（ログインユーザー）を、book_idカラムに上で取得した投稿IDを格納
    favorite.destroy
    redirect_back fallback_location: @book
  end
end
