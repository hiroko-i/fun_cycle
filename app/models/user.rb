class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :profile_image

  validates :nickname, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :description, length: { maximum: 400 }
  validates :prefecture_id, inclusion: { in: 0..47}
  validates :how_to_enjoy, length: { maximum: 100 }
  

  # プロフィールのプルダウン項目
  enum bicycle_model: {
    roadbike: 0, crossbike: 1, mountainbike: 2, gravelbike: 3, cyclocloss: 4,
    triathlonbike: 5, others: 6 
  }
  enum average_distance: {
    max20km: 0, max50km: 1, max100km: 2, max150km: 3, longrider: 4
  }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
