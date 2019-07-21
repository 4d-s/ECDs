# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create!(
   item_name: 'test@test.com',
   stock: '111111',
   name: 'テスト太郎',
)


Airtist.create!(
   artist_name: 'test@test.com',
   price: '120',
   is_sold: 'true'
   
)

