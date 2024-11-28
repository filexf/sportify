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
    username: "CaroCBD",
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
    address: "5 Boulevard Magenta 35000 Rennes",
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
    # puts cloudinary_url
    file = URI.parse(cloudinary_url).open
    # puts file
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

sports_photos = [
  'Palets_usny3s',
  'th_utmxc6',
  'th_jtlasg',
  'th_lzz6hw',
  'th_nlomcn',
  'th_vxxxwl',
  'th_fnfj1l'
]

sports_array = [
  {
    name: "Palet",
    number_of_players_min: 1,
    number_of_players_max: 4,
    photo: ""
  },
  {
    name: "Padel",
    number_of_players_min: 1,
    number_of_players_max: 4,
    photo: ""
  },
  {
    name: "Fléchettes",
    number_of_players_min: 1,
    number_of_players_max: 4,
    photo: ""
  },
  {
    name: "Basketball",
    number_of_players_max: 10,
    photo: ""
  },
  {
    name: "Lancer de mouettes",
    number_of_players_min: 1,
    number_of_players_max: 4,
    photo: ""
  },
  {
    name: "Tir à la mouette",
    number_of_players_min: 1,
    number_of_players_max: 6,
    photo: ""
  },
  {
    name: "Tennis",
    number_of_players_min: 1,
    number_of_players_max: 2,
    photo: ""
  }
]

puts "Creating sport ..."

sports_array.each_with_index do |sport, index|
  new_sport = Sport.new(
    name: sport[:name],
    number_of_players_min: sport[:number_of_players_min],
    number_of_players_max: sport[:number_of_players_max]
  )
  if sport[:photo].blank?
    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{sports_photos[index]}.jpg"
    # puts cloudinary_url
    file = URI.parse(cloudinary_url).open
    # puts file
    new_sport.photo.attach(io: file, filename: "#{new_sport.name}.png", content_type: "image/png")
  else
    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{sport[:photo]}.jpg"
    file = URI.parse(cloudinary_url).open
    new_user.photo.attach(io: file, filename: "#{new_sport.name}.png", content_type: "image/png")
  end
  new_sport.save!
end

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

UserSport.create!(
  user: User.first,
  sport: Sport.first
)

UserSport.create!(
  user: User.find_by(username: "CaroCBD"),
  sport: Sport.find_by(name: "Tir à la mouette")
)

UserSport.create!(
  user: User.find_by(username: "Filex"),
  sport: Sport.find_by(name: "Padel")
)

UserSport.create!(
  user: User.find_by(username: "CaroCBD"),
  sport: Sport.find_by(name: "Padel")
)

UserSport.create!(
  user: User.find_by(username: "Mouettion"),
  sport: Sport.find_by(name: "Padel")
)

puts "#{UserSport.count} created"
# 4. Create the Locations
puts "Creating Locations ..."

piste = Location.create!(
  name: "La Piste",
  address: "68 Mail Francois Mitterrand 35000 Rennes",
  category: :bar
)

paillette = Location.create!(
  name: "La Paillette",
  address: "2 Rue du Pré de Bris 35000 Rennes",
  category: :public_park
)

thabor = Location.create!(
  name: "Parc du Thabor",
  address: " Place Saint-Mélaine 35000 Rennes",
  category: :public_park
)

gayeulles = Location.create!(
  name: "Parc des Gayeulles",
  address: "Avenue des Gayeulles 35700 Rennes",
  category: :public_park
)

brequigny = Location.create!(
  name: "Parc de Brequigny",
  address: "Rue d'Angleterre, 35200 Rennes",
  category: :public_park
)

noyal = Location.create!(
  name: "Salle de Noyal",
  address: "14 Rue de la Bintinais",
  category: :club_with_licence
)

# 5. Create the Playgrounds
puts "Creating Playgrounds ..."
playground_paillette = Playground.create!(
  location: paillette,
  sport: Sport.find_by(name: "Basketball")
)

playground_gayeulles = Playground.create!(
  location: gayeulles,
  sport: Sport.find_by(name: "Tennis")
)

playground_thabor = Playground.create!(
  location: thabor,
  sport: Sport.find_by(name: "Lancer de mouettes")
)

playground_noyal = Playground.create!(
  location: noyal,
  sport: Sport.find_by(name: "Tennis")
)

# 5. Create the Events
puts "Creating Events ..."

Event.create!(
  name: "Pas de Palais ?",
  description: "Plusieurs parties accompagnées de bières et de gal'sauce !",
  start_at: "28/11/2024 14h00",
  end_at: "28/11/2024 23h30",
  playground: playground_paillette,
  organisator: User.find_by(username: "Filex")
)

Event.create!(
  name: "Space Jam",
  description: "Match avec MJ!",
  start_at: "29/11/2024 11h00",
  end_at: "29/11/2024 15h30",
  playground: Playground.last,
  organisator: User.first
)

Event.create!(
  name: "Mouetting 2024",
  description: "Partie de lancer de mouette dans la bonne humeur, tout le monde est le bienvenu! Mouette universelle pour tout niveau Mouette mouette 🕊",
  start_at: "08/12/2024 11h00",
  end_at: "08/12/2024 13h00",
  playground: playground_thabor,
  organisator: User.find_by(username: "CaroCBD")
)

# 6. Create the Participations
puts "Creating Participations ..."

Participation.create!(
  user: User.first,
  event: Event.first,
  status: :pending
)
