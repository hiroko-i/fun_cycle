class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :thanks, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :image

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :prefecture_id, presence: true, inclusion: { in: 1..47 }
  validates :place, presence: true
  validates :address, presence: true
  validates :genre, presence: true

  # 地図
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #ありがとう機能
  def thanked_by?(user)
    thanks.where(user_id: user).exists?
  end

  #ブックマーク機能
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  # 投稿の選択肢
  enum genre: {
    road: 0, view_nature: 5, food_cafe: 10, pass: 15, photospot: 20, caution: 25, others: 30
  }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # タグ機能
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end
end
