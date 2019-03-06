class AddFavoritesArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :favorited, :boolean, default: false
  end
end
