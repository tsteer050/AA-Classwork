class AddIndexesToArtworkCollections < ActiveRecord::Migration[5.2]
  def change
    add_index(:artwork_collections, [:artwork_id, :user_id, :collection_id], name: 'artwork_collections_index')
    add_index :artwork_collections, :artwork_id
    add_index :artwork_collections, :user_id
  end
end
