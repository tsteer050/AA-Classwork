class Cat < ApplicationRecord

    COLORS = ['brown', 'black', 'blue', 'grey', 'orange']
    
    validates :name, :birth_date, :color, :sex, :description, presence: true
    validates :color, inclusion: { in: COLORS }

    def self.colors
        COLORS
    end

    has_many :rental_requests,
        class_name: 'CatRentalRequest',
        foreign_key: :cat_id,
        dependent: :destroy
  
end