
class ArtworkCollection < ApplicationRecord
    validates :user_id, :artwork_id, :collection_id, presence: true
    validates :artwork_id, uniqueness: { scope: :collection_id }

    belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'

    # def artworks
    #     data = ActiveRecord::Base.connection.execute(<<-SQL, self.collection_id)
    #         SELECT
    #             artworks.*
    #         FROM 
    #             artworks
            
    #     SQL
    #     data

    # end
end
