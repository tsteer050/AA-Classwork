class CreateArtworkCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_collections do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.integer :collection_id, null: false
      t.timestamps
      
      # add_index(:likes, [:likeable_type, :likeable_id, :user_id], name: 'likes_index')

      
    end
    
  end
end


