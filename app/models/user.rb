class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :post_comments, dependent: :destroy
  
  attachment :profile_image

  validates :nickname, uniqueness: true, length: { in:1..30 }
  validates :description, length: { maximum: 400 }
  
  enum bicycle_model: { "ロードバイク" => 0, "クロスバイク" => 1, "MTB" => 2, "グラベル・シクロクロス" => 3, "トライアスロンバイク" => 4, "その他" => 5 }
  enum average_distance: { "~20km" => 0, "~50km" => 1, "~100km" => 2, "~150km" => 3, "ロングライダー" => 4 }
end
