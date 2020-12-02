class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user) # ユーザーが『いいね』したかどうか
    favorites.where(user_id: user_id).exists?
  end
end