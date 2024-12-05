require 'open-uri'

# 1. Clean the database 🗑️
puts ""
puts "Cleaning database..."
puts ""

UserSport.destroy_all
Participation.destroy_all
Event.destroy_all
Comment.destroy_all
Publication.destroy_all
User.destroy_all
Playground.destroy_all
Sport.destroy_all
Location.destroy_all

# 2. Create the users
puts "Creating users..."

users_photos = [
  'image_720_kc6kvy',
  'image_720_cys4z5',
  'Categorie_Factrice_hbhzxn',
  'image_720_zxxgmo',
  'image_720_bpwgmz',
  'im6dubmcf6psnwl24n576cfn3ms1_720_dccthv',
  '67sprsnk445kybi1dpdktk7oxj88_720_n1qktc'
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
  },
  {
    first_name: "Lomig",
    last_name: "Enfroy",
    username: "Lomig",
    email: "lomig@gmail.com",
    password: "123456",
    address: "6 rue de la liberté 35000 Rennes",
    photo: ""
  },
  {
    first_name: "Jerôme",
    last_name: "Tan",
    username: "Jérômouette",
    email: "tanj9@gmail.com",
    password: "123456",
    address: "12 rue Vanneau 35000 Rennes",
    photo: ""
  },
  {
    first_name: "Deva",
    last_name: "Sou",
    username: "DevaMouette",
    email: "deva@gmail.com",
    password: "123456",
    address: "7 route de Lorient 35000 Rennes",
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
    address: user[:address]
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

puts "#{User.count} users created"
puts ""

# 3. Create the sports

sports_photos = [
  'dall__e_2024-12-03_19.14.15_-_a_playful_illustration_of_seagulls_playing_the_traditional_breton_game_of_palet._the_scene_features_three_seagulls__one_is_actively_tossing_a_flat__ro_720_welgxf',
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

puts "Creating sports ..."

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

puts "#{Sport.count} sports created"
puts ""

# 3. Create the UserSport
puts "Creating UserSport ..."
UserSport.create!(
  user: User.find_by(username: "Mouettion"),
  sport: Sport.find_by(name: "Tir à la mouette")
)

UserSport.create!(
  user: User.find_by(username: "Mouettion"),
  sport: Sport.find_by(name: "Lancer de mouettes")
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
  user: User.find_by(username: "LaGouelle"),
  sport: Sport.find_by(name: "Padel")
)

puts "#{UserSport.count} usersport created"
puts ""

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
  address: "14 Rue de la Bintinais, 35230 Noyal",
  category: :club_with_licence
)

tyf = Location.create!(
  name: "Tiffany's Pub",
  address: "19 Rue Paul Bert, 35000 Rennes",
  category: :bar
)

beje = Location.create!(
  name: "Bar en scène",
  address: "2 Bd de la Tour d'Auvergne, 35000 Rennes",
  category: :bar
)

roazhon = Location.create!(
  name: "Roazhon Pub",
  address: "148 bis Rue de Lorient, 35000 Rennes",
  category: :bar
)

jacques = Location.create!(
  name: "Tennis Club Saint Jacques",
  address: "3 Pl. Salvador Allendé, 35136 Saint-Jacques-de-la-Lande",
  category: :club_with_licence
)

puts "#{Location.count} locations created"
puts ""


# 5. Create the Playgrounds
puts "Creating Playgrounds ..."

playground_tyf = Playground.create!(
  location: tyf,
  sport: Sport.find_by(name: "Fléchettes")
)

playground_roazhon = Playground.create!(
  location: roazhon,
  sport: Sport.find_by(name: "Fléchettes")
)

playground_beje = Playground.create!(
  location: beje,
  sport: Sport.find_by(name: "Fléchettes")
)

playground_paillette = Playground.create!(
  location: paillette,
  sport: Sport.find_by(name: "Basketball")
)

playground_gayeulles = Playground.create!(
  location: gayeulles,
  sport: Sport.find_by(name: "Tennis")
)

tir_gayeulles = Playground.create!(
  location: gayeulles,
  sport: Sport.find_by(name: "Tir à la mouette")
)

playground_thabor = Playground.create!(
  location: thabor,
  sport: Sport.find_by(name: "Lancer de mouettes")
)

playground_noyal_mouette = Playground.create!(
  location: noyal,
  sport: Sport.find_by(name: "Lancer de mouettes")
)

playground_paillette_mouette = Playground.create!(
  location: paillette,
  sport: Sport.find_by(name: "Lancer de mouettes")
)

playground_noyal = Playground.create!(
  location: noyal,
  sport: Sport.find_by(name: "Tennis")
)

playground_jacques = Playground.create!(
  location: jacques,
  sport: Sport.find_by(name: "Tennis")
)

playground_piste = Playground.create!(
  location: piste,
  sport: Sport.find_by(name: "Palet")
)

puts "#{Playground.count} playgrounds created"
puts ""


# 5. Create the Events
puts "Creating Events and publications associated for feed ..."

event_1 = Event.create!(
  name: "Shooter tireur d'élite",
  description: "Amoureux du tir à la mouette, je souhaite vous réunir pour tirer de la mouette",
  start_at: "15/12/2024 14h00",
  end_at: "15/12/2024 16h30",
  playground: tir_gayeulles,
  organisator: User.find_by(username: "Mouettion")
)

publi_1 = Publication.create!(
  likes:rand(1..50),
  title: event_1.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "Mouettion").id,
  sport_id: event_1.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_1.description
)

event_2 = Event.create!(
  name: "Pas de Palais ?",
  description: "Plusieurs parties accompagnées de bières et de gal'sauce !",
  start_at: "28/11/2024 14h00",
  end_at: "28/11/2024 23h30",
  playground: playground_piste,
  organisator: User.find_by(username: "Filex")
)

publi_2 = Publication.create!(
  likes:rand(1..50),
  title: event_2.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "Filex").id,
  sport_id: event_2.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_2.description
)

event_3 = Event.create!(
  name: "Space Jam",
  description: "Match avec MJ!",
  start_at: "29/11/2024 11h00",
  end_at: "29/11/2024 15h30",
  playground: playground_paillette,
  organisator: User.find_by(username: "LaGouelle")
)

publi_3 = Publication.create!(
  likes:rand(1..50),
  title: event_3.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "LaGouelle").id,
  sport_id: event_3.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_3.description
)

event_4 = Event.create!(
  name: "Open de Noyal",
  description: "Match pour niveau 30/1",
  start_at: "14/12/2024 10h00",
  end_at: "14/12/2024 10h30",
  playground: playground_noyal,
  organisator: User.find_by(username: "LaGouelle")
)

publi_4 = Publication.create!(
  likes:rand(1..50),
  title: event_4.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "LaGouelle").id,
  sport_id: event_4.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_4.description
)

event_5 = Event.create!(
  name: "Mouetting 2024",
  description: "Partie de lancer de mouettes dans la bonne humeur, tout le monde est le bienvenu! Mouette universelle pour tout niveau Mouette mouette 🕊",
  start_at: "13/12/2024 14h00",
  end_at: "13/12/2024 16h00",
  playground: playground_thabor,
  organisator: User.find_by(username: "CaroCBD")
)

publi_5 = Publication.create!(
  likes:rand(1..50),
  title: event_5.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "CaroCBD").id,
  sport_id: event_5.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_5.description
)

event_6 = Event.create!(
  name: "Initiation - lancer de mouettes",
  description: "Session d'entraînement de lancer de mouettes. Niveau intermédiaire requis afin de profiter au mieux de l'entraînement 💪 - Venir avec ses mouettes personnelles",
  start_at: "28/12/2024 16h00",
  end_at: "28/12/2024 18h00",
  playground: playground_noyal_mouette,
  organisator: User.find_by(username: "LaGouelle")
)

publi_6 = Publication.create!(
  likes:rand(1..50),
  title: event_6.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "LaGouelle").id,
  sport_id: event_6.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_6.description
)

event_7 = Event.create!(
  name: "Déjeuner - lancé de mouettes",
  description: "Entre deux réunions, venez lancer des mouettes avec nous sur la pause déjeuner. Venir avec son déjeuner et ses mouettes",
  start_at: "17/12/2024 12h30",
  end_at: "17/12/2024 13h30",
  playground: playground_paillette_mouette,
  organisator: User.find_by(username: "LaGouelle")
)

publi_7 = Publication.create!(
  likes:rand(1..50),
  title: event_7.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "LaGouelle").id,
  sport_id: event_7.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_7.description
)

event_8 = Event.create!(
  name: "Fléchettes pour débutants",
  description: "Partie for fun au Tyf !",
  start_at: "10/12/2024 19h00",
  end_at: "10/12/2024 23h00",
  playground: playground_tyf,
  organisator: User.find_by(username: "Filex")
)

publi_8 = Publication.create!(
  likes:rand(1..50),
  title: event_8.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "Filex").id,
  sport_id: event_8.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_8.description
)

event_9 = Event.create!(
  name: "Ca flèche fort!",
  description: "Celui qui perd paye sa pinte !!",
  start_at: "07/12/2024 19h00",
  end_at: "07/12/2024 23h00",
  playground: playground_roazhon,
  organisator: User.find_by(username: "Filex")
)

publi_9 = Publication.create!(
  likes:rand(1..50),
  title: event_9.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "Filex").id,
  sport_id: event_9.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_9.description
)

event_10 = Event.create!(
  name: "Spécial Cupidon",
  description: "Pour la Saint Valentin, soirée de love !",
  start_at: "14/02/2024 19h00",
  end_at: "14/02/2024 23h00",
  playground: playground_beje,
  organisator: User.find_by(username: "Mouettion")
)

publi_10 = Publication.create!(
  likes:rand(1..50),
  title: event_10.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "Mouettion").id,
  sport_id: event_10.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_10.description
)

event_11 = Event.create!(
  name: "Rennes Lan Garros",
  description: "Match pour débutants, sur terre battue",
  start_at: "15/12/2024 19h00",
  end_at: "15/12/2024 20h30",
  playground: playground_gayeulles,
  organisator: User.find_by(username: "CaroCBD")
)

publi_11 = Publication.create!(
  likes:rand(1..50),
  title: event_11.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "CaroCBD").id,
  sport_id: event_11.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_11.description
)

event_12 = Event.create!(
  name: "Open de Saint Jaques",
  description: "Tournoi, niveau demandé entre 15 et 15/5",
  start_at: "21/12/2024 10h00",
  end_at: "21/12/2024 11h30",
  playground: playground_jacques,
  organisator: User.find_by(username: "LaGouelle")
)

publi_12 = Publication.create!(
  likes:rand(1..50),
  title: event_12.name,
  kind_of: "event_creation",
  user_id: User.find_by(username: "LaGouelle").id,
  sport_id: event_12.sport.id,
  posted_at: rand(1.week).seconds.ago,
  content: event_12.description
)

puts "#{Event.count} events created"
puts ""


# 6. Create the Participations
puts "Creating Participations ..."

Participation.create!(
  user: User.find_by(username: "CaroCBD"),
  event: Event.find_by(name: "Mouetting 2024"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Filex"),
  event: Event.find_by(name: "Pas de Palais ?"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Filex"),
  event: Event.find_by(name: "Mouetting 2024"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Filex"),
  event: Event.find_by(name: "Fléchettes pour débutants"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Filex"),
  event: Event.find_by(name: "Ca flèche fort!"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "LaGouelle"),
  event: Event.find_by(name: "Mouetting 2024"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "LaGouelle"),
  event: Event.find_by(name: "Pas de Palais ?"),
  status: :pending
)

Participation.create!(
  user: User.find_by(username: "LaGouelle"),
  event: Event.find_by(name: "Space Jam"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "CaroCBD"),
  event: Event.find_by(name: "Spécial Cupidon"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Mouettion"),
  event: Event.find_by(name: "Spécial Cupidon"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "Mouettion"),
  event: Event.find_by(name: "Shooter tireur d'élite"),
  status: :accepted
)

Participation.create!(
  user: User.find_by(username: "LaGouelle"),
  event: Event.find_by(name: "Open de Noyal"),
  status: :accepted
)
puts "#{Participation.count} participations created"
puts ""



# Create publications from user about Lancer de Mouettes
puts "Create publications"

publi_a = Publication.new(
  likes: 1,
  user: User.find_by(username: "Mouettion"),
  title: "Retour sur l'initiation d'hier",
  content: "Hier, 7 nouveaux adeptes ont rejoint la communauté",
  sport: Sport.find_by(name:"Lancer de mouettes"),
  kind_of: "player_creation",
  posted_at: rand(1.day).seconds.ago
)

cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/image_720_p75atn.jpg"
file = URI.parse(cloudinary_url).open
publi_a.photo.attach(io: file, filename: "#{publi_a.title}.png", content_type: "image/png")

publi_a.save!

publi_b = Publication.new(
  likes: 2,
  user: User.find_by(username: "Jérômouette"),
  title: "Photo du match d'hier",
  content: "Super match hier soir, les Mouettes ont battu les Hermines 82-65. Hâte de programmer la revanche",
  sport: Sport.find_by(name:"Basketball"),
  kind_of: "player_creation",
  posted_at: rand(1.day).seconds.ago
)

cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/image_720_ud6bla.jpg"
file = URI.parse(cloudinary_url).open
publi_b.photo.attach(io: file, filename: "#{publi_b.title}.png", content_type: "image/png")

publi_b.save!

puts 'add comment'

comment_lomig = Comment.create!(
  user: User.find_by(username: "Lomig"),
  publication: publi_5,
  content: "Le Mouetting 2024 commence dans 1 heure !",
)

comment_jeromouette = Comment.create!(
  user: User.find_by(username: "Jérômouette"),
  publication: publi_a,
  content: "Super ça donne envie d'essayer, ça doit être marrant",
)

comment_devamouette = Comment.create!(
  user: User.find_by(username: "DevaMouette"),
  publication: publi_a,
  content: "@Jérômouette, viens on s'inscrit à la prochaine session",
)

puts "#{Publication.count} publications created"


puts "Done!"
puts ""
