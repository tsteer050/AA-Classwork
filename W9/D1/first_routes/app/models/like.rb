class Like < ApplicationRecord
    validates :likeable_id, presence: true
    validates :likeable_type, inclusion: { in: ["Artwork", "Comment"] }

    belongs_to :likeable, polymorphic: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'
end



