class ArtworkCollection < ApplicationRecord
    validates :user_id, :artwork_id, :collection_id, presence: true
    validates :artwork_id, uniqueness: { scope: :collection_id }

    belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'

    has_and_belongs_to_many :artworks,
    foreign_key: :artwork_id,
    class_name: 'Artwork'
end