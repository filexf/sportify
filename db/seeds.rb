require 'open-uri'

# 1. Clean the database 🗑️
puts "Cleaning database..."

UserSport.destroy_all
Participation.destroy_all
Event.destroy_all
User.destroy_all
Playground.destroy_all
Sport.destroy_all
Location.destroy_all

# 2. Create the users
puts "Creating users ..."

users_photos = [
  'Mouette_boxeuse_snsbx5',
  'Groupe_Niquetamouette_wil8gj',
  'Categorie_Factrice_hbhzxn',
  'Categorie_Sprinteuse_cv2kr8'
]

# User.create!(
#   first_name: "Caroline",
#   last_name: "Cerbelaud",
#   username: "Caro CBD",
#   email: "caroline.cerbelaud@gmail.com",
#   password: "123456",
#   address: "60 Mail Francois Mitterrand 35000 RENNES",
#   photo: ""
# )

# User.create!(
#   first_name: "Marion",
#   last_name: "Vives",
#   username: "Mouettion",
#   email: "mvives.dev@gmail.com",
#   password: "123456",
#   address: "35220 Chateaubourg",
#   photo: ""
# )

# User.create!(
#   first_name: "Felix",
#   last_name: "Orain",
#   username: "Filex",
#   email: "felix.orain@gmail.com",
#   password: "123456",
#   address: "Boulevard Marbeuf 35000 Rennes",
#   photo: ""
# )

# User.create!(
#   first_name: "Leo",
#   last_name: "Tremoureux",
#   username: "La Gouelle",
#   email: "ltremoureux@hotmail.fr",
#   password: "123456",
#   address: "92 Rue de Lorient 35000 Rennes",
#   photo: ""
# )

users_array = [
  {
    first_name: "Leo",
    last_name: "Tremoureux",
    username: "LaGouelle",
    email: "ltremoureux@hotmail.fr",
    password: "123456",
    address: "92 Rue de Lorient 35000 Rennes",
    photo: ""
  },
  {
    first_name: "Caroline",
    last_name: "Cerbelaud",
    username: "Caro CBD",
    email: "caroline.cerbelaud@gmail.com",
    password: "123456",
    address: "60 Mail Francois Mitterrand 35000 RENNES",
    photo: ""
  },
  {
    first_name: "Marion",
    last_name: "Vives",
    username: "Mouettion",
    email: "mvives.dev@gmail.com",
    password: "123456",
    address: "35220 Chateaubourg",
    photo: ""
  },
  {
    first_name: "Felix",
    last_name: "Orain",
    username: "Filex",
    email: "felix.orain@gmail.com",
    password: "123456",
    address: "Boulevard Marbeuf 35000 Rennes",
    photo: ""
  }
]

users_array.each_with_index do |user, index|
  new_user = User.new(
    first_name: user[:name],
    last_name: user[:last_name],
    username: user[:username],
    email: user[:email],
    password: user[:password],
    address: user[:address],
  )
  if user[:photo].blank?
    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{users_photos[index]}.jpg"
    puts cloudinary_url
    file = URI.parse(cloudinary_url).open
    puts file
    new_user.photo.attach(io: file, filename: "#{new_user.username}.png", content_type: "image/png")
  else
    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{user[:photo]}.jpg"
    file = URI.parse(cloudinary_url).open
    new_user.photo.attach(io: file, filename: "#{new_user.username}.png", content_type: "image/png")
  end
  new_user.save!
end

puts "#{User.count} created"

# 3. Create the sports

puts "Creating sport ..."
Sport.create!(
  name: "Palet",
  number_of_players_min: 1,
  number_of_players_max: 4,
  # photo_url: "https://res.cloudinary.com/dcipyz0mn/image/upload/v1732709340/Palets_usny3s.jpg"
)

Sport.create!(
  name: "Padel",
  number_of_players_min: 1,
  number_of_players_max: 4,
  # photo_url: "https://res.cloudinary.com/dcipyz0mn/image/upload/v1732709351/th_utmxc6.jpg"
)

Sport.create!(
  name: "Fléchettes",
  number_of_players_min: 1,
  number_of_players_max: 4,
  # photo_url: "https://res.cloudinary.com/dcipyz0mn/image/upload/v1732709737/th_jtlasg.jpg"
)

Sport.create!(
  name: "Basketball",
  number_of_players_max: 10,
  # photo_url: "https://res.cloudinary.com/dcipyz0mn/image/upload/v1732709394/th_lzz6hw.jpg"
  )

puts "#{Sport.count} created"

# 3. Create the UserSport
puts "Creating UserSport ..."
UserSport.create!(
  user: User.first,
  sport: Sport.first
)

UserSport.create!(
  user: User.first,
  sport: Sport.last
)

UserSport.create!(
  user: User.last,
  sport: Sport.first
)

puts "#{UserSport.count} created"
# 4. Create the Locations
puts "Creating Locations ..."

Location.create!(
  name: "La Piste",
  address: "68 Mail Francois Mitterrand 35000 Rennes",
  category: :bar
)

Location.create!(
  name: "La Paillette",
  address: "2 Rue du Pré de Bris 35000 Rennes",
  category: :public_park
)


# 5. Create the Playgrounds
puts "Creating Playgrounds ..."
Playground.create!(
  location: Location.first,
  sport: Sport.first
)

Playground.create!(
  location: Location.last,
  sport: Sport.last
)

# 5. Create the Events
puts "Creating Events ..."

Event.create!(
  name: "Pas de Palais ?",
  description: "Plusieurs parties accompagnées de bières et de gal'sauce !",
  start_at: "28/11/2024 14h00",
  end_at: "28/11/2024 23h30",
  playground: Playground.first,
  organisator: User.last
)

Event.create!(
  name: "Space Jam",
  description: "Match avec MJ!",
  start_at: "29/11/2024 11h00",
  end_at: "29/11/2024 15h30",
  playground: Playground.last,
  organisator: User.first
)

# 6. Create the Participations
puts "Creating Participations ..."

Participation.create!(
  user: User.first,
  event: Event.first,
  status: :pending
)
