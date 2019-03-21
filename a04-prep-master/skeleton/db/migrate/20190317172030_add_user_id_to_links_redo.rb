class AddUserIdToLinksRedo < ActiveRecord::Migration[5.1]
  def change
    remove_column :links, :user_id
    add_column :links, :user_id, :integer, null: false

  end
end
