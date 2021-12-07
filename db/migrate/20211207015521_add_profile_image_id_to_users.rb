class AddProfileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :description, :text
    add_column :users, :prefecture, :integer
    add_column :users, :bicycle_model, :integer
    add_column :users, :average_distance, :integer
    add_column :users, :how_to_enjoy, :string
  end
end
