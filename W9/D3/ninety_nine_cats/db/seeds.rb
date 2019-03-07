# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

Cat.create([
    { name: 'Mittens', birth_date: '2015/01/20', sex: 'M', color: 'black', description: 'He has white paws' }, 
    { name: 'Roma', birth_date: '2013/09/13', sex: 'F', color: 'grey', description: 'She loves fluffy pillows' },
    { name: 'Diego', birth_date: '2010/05/24', sex: 'M', color: 'orange', description: 'He speaks with a thick accent' }
])

CatRentalRequest.create([
    { cat_id: Cat.first.id, start_date: '2015/01/20', end_date: '2015/01/25' }, 
    { cat_id: Cat.first.id, start_date: '2015/01/12', end_date: '2015/01/18' }, 
    { cat_id: Cat.last.id, start_date: '2015/02/05', end_date: '2015/02/25' }, 
])



# c = CatRentalRequest.new(cat_id: Cat.first.id, start_date: '2015/01/16', end_date: '2015/01/21')