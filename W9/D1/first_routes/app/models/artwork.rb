class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true, uniqueness: true
    validates :artist_id, presence: true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: 'User'

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
    
    has_many :comments,
    foreign_key: :artwork_id,
    class_name: 'Comment',
    dependent: :destroy

    has_many :likes, as: :likeable

    has_many :liking_users,
    through: :likes,
    source: :user

    has_and_belongs_to_many :collections,
    foreign_key: :artwork_id,
    class_name: 'ArtworkCollection'

    belongs_to :collections2,
    primary_key: :artwork_id,
    foreign_key: :id,
    class_name: 'ArtworkCollection'
end

# has_and_belongs_to_many