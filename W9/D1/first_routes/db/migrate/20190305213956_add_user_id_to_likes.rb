class AddUserIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user_id, :integer
    remove_index :likes, column: [:likeable_type, :likeable_id]
    add_index(:likes, [:likeable_type, :likeable_id, :user_id], name: 'likes_index')
  end
end


