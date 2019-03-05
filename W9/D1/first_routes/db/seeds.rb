# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

User.create([{username: 'Vincent van Gogh'}, {username: 'Eyvind Earle'}])
Artwork.create([
    {artist_id: User.first.id, image_url: '/images/img1', title: 'Starry Night'}, 
    {artist_id: User.last.id, image_url: '/images/img2', title: 'Dawns First Light'}
])
ArtworkShare.create([
    { viewer_id: User.first.id, artwork_id: Artwork.first.id }, 
    { viewer_id: User.last.id, artwork_id: Artwork.last.id }, 
    { viewer_id: User.first.id, artwork_id: Artwork.last.id }
])



    