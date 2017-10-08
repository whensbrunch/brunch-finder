# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create([
  {name: "Pani", address: "Nicaragua 6044, Buenos Aires, Argentina"},
  {name: "Brandon", address: "Fitz Roy 1722, Buenos Aires"},
  {name: "Chicken Bros", address: "Thames 1795, Buenos Aires, Argentina"}
])

User.create([
  {name: "David Stevens", email: "davidfstevens14@gmail.com", password: "foobar", password_confirmation: "foobar"}
])

Tag.create([
  {name: "trendy"},
  {name: "bottomless mimosas"},
  {name: "cheto"}
])

Restaurant.find_by(name: "Pani").tags << Tag.find_by(name: "trendy")
Restaurant.find_by(name: "Pani").tags << Tag.find_by(name: "cheto")
Restaurant.find_by(name: "Brandon").tags << Tag.find_by(name: "cheto")
Restaurant.find_by(name: "Chicken Bros").tags << Tag.find_by(name: "bottomless mimosas")
