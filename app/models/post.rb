class Post < ApplicationRecord
  belongs_to :user
  # has_many :thanks, dependent::destroy
  # has_many :post_comments, dependent::destroy
  attachment :image
  
  # 投稿の選択肢
  enum genre: { "グルメ" => 0, "道・峠" => 1, "写真スポット" => 2, "自然・景色" => 3, "注意" => 4, "その他" => 5 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
