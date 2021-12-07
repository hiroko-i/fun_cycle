class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image_id
      t.integer :genre
      t.string :title
      t.text :explanation
      t.integer :prefecture
      t.string :place
      t.string :address

      t.timestamps
    end
  end
end
