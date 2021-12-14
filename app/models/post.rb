class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  # has_many :thanks, dependent::destroy
  has_many :post_comments, dependent: :destroy
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  attachment :image
  
  # 投稿の選択肢
  enum genre: { "グルメ" => 0, "道・峠" => 1, "写真スポット" => 2, "自然・景色" => 3, "注意" => 4, "その他" => 5 }
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
