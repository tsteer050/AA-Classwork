class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, index: true
      t.timestamps
    end
  end
end



# User owns likes 
#     |
# Likes (poly)
#     |
# Artwork gets liked 


# user 1 liked artwork 2 

# likes 

# likeable_type user      likeable_id 1
# likeable_type artwork    likeable_id 2

# user.likes ---> likeable 

#     likeable_type   likeable_id 
#      user            1          
#      artwork         1            
#      user            2
#      artwork         2

# Artwork

#   has_many :likes, as :likeable

#   has_many :liking_users, 
#   through: :likes, 
#   source: :likeable, 
#   source_type: 'User'
  

#   artwork 
#   which users liked it