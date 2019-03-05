class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :viewer_id, null: false
      t.integer :artwork_id, null: false
    
      t.timestamps

      t.index :viewer_id
      t.index :artwork_id
    end
  end
end
