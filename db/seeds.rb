require 'csv'

# TODO: remove entries with nil lat / lng

seeds_path = Rails.root.join("lib", "seeds", "brunch_places.csv")
CSV.foreach(seeds_path, headers: true) do |row|
  Restaurant.create(
    name: row['name'],
    address: row['address'],
    price: row['price'],
    barrio: row['barrio'],
    review_count: row['review_count'],
    rating: row['rating']
  )
  puts 'Created ' + row['name']
end

Restaurant.create(
  name: "Chicken Bros",
  address: "Thames 1795, Buenos Aires, Argentina"
)

User.create!(
  name: "David Stevens",
  email: "davidfstevens14@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

Tag.create([
  {name: "trendy"},
  {name: "bottomless mimosas"},
  {name: "cheto"}
])

# Restaurant.find_by(name: "Pani").tags << Tag.find_by(name: "trendy")
# Restaurant.find_by(name: "Pani").tags << Tag.find_by(name: "cheto")
# Restaurant.find_by(name: "Brandon").tags << Tag.find_by(name: "cheto")
# Restaurant.find_by(name: "Chicken Bros").tags << Tag.find_by(name: "bottomless mimosas")

99.times do |n|
  name = Faker::Name.name
  email = "monster-#{n+1}@example.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end
