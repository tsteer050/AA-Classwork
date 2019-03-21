class AddLinkIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :link_id, :integer, null: false
  end
end
