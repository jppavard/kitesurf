require 'faker'

puts 'Deleting equipments & users'
Equipment.delete_all
User.delete_all
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

puts 'Creating Equipment seeds...'

array = User.all
title = ["Super Kite pour débutant", "Kite au Grau du Roi pour expert","Kite freestyle pour expert","Petit Kite Junior pour profil intermédiaire à Grenoble","Epic Kites à récupérer à La Rochelle"]
brand = ["Blade", "Takoon", "North", "Duotone", "F-One", "AirRush"]
style =["wave", "freeride", "freestyle", "foil"]
model =["dice", "rebel", "infinity", "tigerush"]
description = ["Une board tendre, parfait pour les débutants. Une aile pas trop nerveuse.","Une board junior pour les jeunes qui ont déjà un petit niveau. En très bon état."]

10.times do
  equipment = Equipment.new
  equipment.rating  = 0
  equipment.owner   = array.sample
  equipment.title   = title.sample
  equipment.brand   = brand.sample
  equipment.model   = model.sample
  equipment.style   = style.sample
  equipment.location = Faker::Address.city
  equipment.price   = (45..100).to_a.sample
  equipment.remote_photo_url = "https://res.cloudinary.com/dcjawxszi/image/upload/v1566319982/kitesurf_zet4x5.jpg"
  equipment.size = (2..16).to_a.sample
  equipment.description = description.sample
  equipment.save
end

puts 'Equipments created!...'


  user_with_three_equipements = User.new
  name = Faker::Name.name .split(" ")
  user_with_three_equipements.first_name = name[0]
  user_with_three_equipements.last_name = name[1]
  user_with_three_equipements.address = Faker::Address.city
  user_with_three_equipements.phone_number = Faker::PhoneNumber.phone_number
  user_with_three_equipements.owner = false
  user_with_three_equipements.remote_avatar_url = "https://picsum.photos/id/635/200/300"
  user_with_three_equipements.email = "user1@example.com"
  user_with_three_equipements.password = "000000"
  user_with_three_equipements.save

  equipment1 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Super Kite pour débutant", brand: "Blade", size: 10, style: 'wave', model: "Infinity", location: "Lacanau", price: 59, description: "Une board tendre, parfait pour les débutants. Une aile pas trop nerveuse." )
  equipment2 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Kite au Grau du Roi pour expert", brand: "Tacoon", size: 12, style: "freeride", model: "B52", location: "Grau du Roi", price: 80, description: "J'ai la board et l'aile depuis 5 ans. J'en prend soin et j'ai un très bon niveau. A récupérer au Grau du Roi." )
  equipment3 = Equipment.create!(rating: 0, owner: user_with_three_equipements, title: "Grand Kite pour solide gaillard!", brand: "Genetrix", size: 9, style: "foil", model: "Gorgeous", location: "Genève", price: 52, description: "Pour les personnes de plus de 100kg qui ont un bon petit niveau." )


  Reservation.create!({
    equipment: equipment2,
    user: array.sample,
    start_date: 1.day.from_now,
    paid: false,
  })


  Reservation.create!({
    equipment: equipment3,
    user: array.sample,
    start_date: 1.day.from_now,
    paid: false,
  })

  Reservation.create!({
    equipment: equipment3,
    user: array.sample,
    start_date: 3.day.from_now,
    paid: false,
  })

