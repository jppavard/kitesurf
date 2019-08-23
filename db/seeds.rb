require 'faker'


  CLOUDINARY_ID = [
    "google-image_0002_c86jgs",
    "google-image_0003_abgg3f",
    "google-image_0015_aicamf",
    "photo-1541470056984-badb95d31fb9_l6kju5",
    "google-image_0007_hlp229",
    "google-image_0011_kpt8je",
    "google-image_0001_apxuki",
    "google-image_0008_jurrrx",
    "google-image_0004_vbxgv1",
    "google-image_0016_e3nc9n",
    "google-image_0009_a0qldy",
    "google-image_0014_tugkex",
    "google-image_0012_cm3kaq",
    "photo-1516370873344-fb7c61054fa9_jk8noa",
    "google-image_0013_bxfmb2",
    "google-image_0005_mle8ra",
    "googliser-gallery-_kite_surf_qukiri",
    "google-image_0010_gfiixz"
    ]

puts 'Deleting equipments & users'
Equipment.destroy_all
User.destroy_all
puts 'Creating Users seed...'

2.times do
  user = User.new
  name = Faker::Name.name .split(" ")
  user.first_name = name[0]
  user.last_name = name[1]
  user.address = Faker::Address.city
  user.phone_number = Faker::PhoneNumber.phone_number
  user.owner = false
  user.remote_avatar_url = "https://picsum.photos/id/635/200/300"
  user.email = Faker::Internet.email
  user.password = "000000"
  user.save
end

guillaume = User.new
guillaume.first_name = 'guillaume'
guillaume.last_name = 'Cromer'
guillaume.address = 'Grenoble'
guillaume.phone_number = Faker::PhoneNumber.phone_number
guillaume.owner = false
guillaume.remote_avatar_url = "https://picsum.photos/id/635/200/300"
guillaume.email = 'guillaumecromer@gmail.com'
guillaume.password = "000000"
guillaume.save

jerome = User.new
jerome.first_name = 'Jerome'
jerome.last_name = "Courriol"
jerome.address = Faker::Address.city
jerome.phone_number = Faker::PhoneNumber.phone_number
jerome.owner = false
jerome.remote_avatar_url = "https://picsum.photos/id/635/200/300"
jerome.email = 'jerome@gmail.com'
jerome.password = "000000"
jerome.save


puts 'Creating Equipment seeds...'

array = User.all
title = ["Kite freestyle pour expert","Epic Kites à récupérer le plus vite possible à La Rochelle sans delai"]
brand = ["Blade", "Takoon hyper puissant trop debile"]
style =["wave", "freeride", "freestyle", "foil"]
model =["dice", "rebel", "infinity", "tigerush"]
description = ["Une board tendre, parfait pour les débutants. Une aile pas trop nerveuse.","Une board junior pour les jeunes qui ont déjà un petit niveau. En très bon état."]

equipment1 = Equipment.new
  equipment1.rating  = 0
  equipment1.owner   = jerome
  equipment1.title   = title.sample
  equipment1.brand   = brand.sample
  equipment1.model   = model.sample
  equipment1.style   = 'freestyle'
  equipment1.location = "Sainte-Anne, Guadeloupe"
  equipment1.price   = (45..100).to_a.sample
  equipment1.photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566570767/#{CLOUDINARY_ID.sample}.jpg")
  equipment1.size = (2..16).to_a.sample
  equipment1.description = description.sample
  equipment1.save

equipment2 = Equipment.new
  equipment1.rating  = 0
  equipment1.owner   = jerome
  equipment1.title   = title.sample
  equipment1.brand   = brand.sample
  equipment1.model   = model.sample
  equipment1.style   = 'freestyle'
  equipment1.location = "Gosier, Guadeloupe"
  equipment1.price   = (45..100).to_a.sample
  equipment1.photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566570767/#{CLOUDINARY_ID.sample}.jpg")
  equipment1.size = (2..16).to_a.sample
  equipment1.description = description.sample
  equipment1.save

equipment3 = Equipment.new
  equipment1.rating  = 0
  equipment1.owner   = jerome
  equipment1.title   = title.sample
  equipment1.brand   = brand.sample
  equipment1.model   = model.sample
  equipment1.style   = 'freestyle'
  equipment1.location = "Deshaies, Guadeloupe"
  equipment1.price   = (45..100).to_a.sample
  equipment1.photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566570767/#{CLOUDINARY_ID.sample}.jpg")
  equipment1.size = (2..16).to_a.sample
  equipment1.description = description.sample
  equipment1.save

CLOUDINARY_ID.each do |cloudinary_id|
  equipment = Equipment.new
  equipment.rating  = 0
  equipment.owner   = array.sample
  equipment.title   = title.sample
  equipment.brand   = brand.sample
  equipment.model   = model.sample
  equipment.style   = style.sample
  equipment.location = Faker::Address.city
  equipment.price   = (45..100).to_a.sample
  equipment.photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566570767/#{cloudinary_id}.jpg")
  equipment.size = (2..16).to_a.sample
  equipment.description = description.sample
  equipment.save
end



# puts 'Equipments created!...'


#   user_with_three_equipements = User.new
#   name = Faker::Name.name .split(" ")
#   user_with_three_equipements.first_name = name[0]
#   user_with_three_equipements.last_name = name[1]
#   user_with_three_equipements.address = Faker::Address.city
#   user_with_three_equipements.phone_number = Faker::PhoneNumber.phone_number
#   user_with_three_equipements.owner = false
#   user_with_three_equipements.remote_avatar_url = "https://picsum.photos/id/635/200/300"
#   user_with_three_equipements.email = "user1@example.com"
#   user_with_three_equipements.password = "000000"
#   user_with_three_equipements.save

#   equipment1 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Super Kite pour débutant", brand: "Blade", size: 10, style: 'wave', model: "Infinity", location: "Lacanau", price: 59, description: "Une board tendre, parfait pour les débutants. Une aile pas trop nerveuse." )
#   equipment2 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Kite au Grau du Roi pour expert", brand: "Tacoon", size: 12, style: "freeride", model: "B52", location: "Grau du Roi", price: 80, description: "J'ai la board et l'aile depuis 5 ans. J'en prend soin et j'ai un très bon niveau. A récupérer au Grau du Roi." )
#   equipment3 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Grand Kite pour solide gaillard!", brand: "Genetrix", size: 9, style: "foil", model: "Gorgeous", location: "Genève", price: 52, description: "Pour les personnes de plus de 100kg qui ont un bon petit niveau." )
#   equipment1.remote_photo_url = "https://res.cloudinary.com/dcjawxszi/image/upload/v1566319982/kitesurf_zet4x5.jpg"
#   equipment2.remote_photo_url = "https://res.cloudinary.com/dcjawxszi/image/upload/v1566319982/kitesurf_zet4x5.jpg"
#   equipment3.remote_photo_url = "https://res.cloudinary.com/dcjawxszi/image/upload/v1566319982/kitesurf_zet4x5.jpg"


#   Reservation.create!({
#     equipment: equipment2,
#     user: array.sample,
#     start_date: 1.day.from_now,
#     paid: false,
#   })


#   Reservation.create!({
#     equipment: equipment3,
#     user: array.sample,
#     start_date: 1.day.from_now,
#     paid: false,
#   })

#   Reservation.create!({
#     equipment: equipment3,
#     user: array.sample,
#     start_date: 3.day.from_now,
#     paid: false,
#   })

