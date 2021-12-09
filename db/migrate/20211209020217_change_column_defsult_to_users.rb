class ChangeColumnDefsultToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :prefecture_id, :integer, default: '0'
    change_column :posts, :prefecture_id, :integer, default: '0'
  end
  
  def down
    change_column :users, :prefecture_id, :integer
    change_column :posts, :prefecture_id, :integer
  end
end
