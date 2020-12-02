class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user) # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べるメソッドを定義
    favorites.where(user_id: user_id).exists? # モデル名.where(任意のカラム名: 格納されている値) user_idカラムの全レコードを検索し、user.idが含まれているか確認
  end
end