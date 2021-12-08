class RenamePrefectureColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :prefecture, :prefecture_id
    rename_column :posts, :prefecture, :prefecture_id
  end
end
