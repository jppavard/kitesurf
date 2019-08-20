require 'faker'

puts 'Deleting equipments & users'
Equipment.delete_all
User.delete_all
puts 'Creating Users seed...'

10.times do
  user = User.new
  name = Faker::Name.name .split(" ")
  user.first_name = name[0]
  user.last_name = name[1]
  user.address = Faker::Address.full_address
  user.phone_number = Faker::PhoneNumber.phone_number
  user.owner = false
  user.remote_avatar_url = "https://picsum.photos/id/635/200/300"
  user.email = Faker::Internet.email
  user.password = "000000"
  user.save
end
p User.all

puts 'Creating Equipment seeds...'
array = User.all
Equipment.create!(rating: 0, owner: array.sample, title: "Super Kite pour débutant", brand: "Blade", size: 10, style: 'wave', model: "Infinity", location: "Lacanau", price: 59, description: "Une board tendre, parfait pour les débutants. Une aile pas trop nerveuse." )
Equipment.create!(rating: 0, owner: array.sample, title: "Kite au Grau du Roi pour expert", brand: "Tacoon", size: 12, style: "freeride", model: "B52", location: "Grau du Roi", price: 80, description: "J'ai la board et l'aile depuis 5 ans. J'en prend soin et j'ai un très bon niveau. A récupérer au Grau du Roi." )
Equipment.create!(rating: 0, owner: array.sample, title: "Grand Kite pour solide gaillard!", brand: "Genetrix", size: 9, style: "foil", model: "Gorgeous", location: "Genève", price: 52, description: "Pour les personnes de plus de 100kg qui ont un bon petit niveau." )
Equipment.create!(rating: 0, owner: array.sample, title: "Kite freestyle pour expert", brand: "Gong", size: 8, style: "freestyle", model: "HUUUGE", location: "Rochefort", price: 63, description: "Tu aimes les jump. Tu as un peu d'expérience?! Tu vas te faire plaisir!" )
Equipment.create!(rating: 0, owner: array.sample, title: "Kite Airush en super état à Paris", brand: "Airush", size: 5, style: "wave", model: "Big guy", location: "Paris", price: 75, description: "Je l'utilise pas assez souvent avec mon boulot à Paris... donc autant vous la louer non?" )
Equipment.create!(rating: 0, owner: array.sample, title: "Petit Kite Junior pour profil intermédiaire à Grenoble", brand: "Elliot", size: 10, style: "wave", model: "beauty", location: "Grenoble", price: 55, description: "Une board junior pour les jeunes qui ont déjà un petit niveau. En très bon état." )
Equipment.create!(rating: 0, owner: array.sample, title: "Kite Foil F-One à Bordeaux", brand: "F-One", size: 8, style: "foil", model: "FortyTwo", location: "Bordeaux", price: 63, description: "Allez, je vous la prête mais faites y attention! :) " )
Equipment.create!(rating: 0, owner: array.sample, title: "Epic Kites à récupérer à La Rochelle", brand: "Epic Kites", size: 10, style: "freeride", model: "Hack4Life", location: "La Rochelle", price: 42, description: "Board et aile à récupérer à La Rochelle en bon état pour du freeride dans l'Océan! " )

puts 'Equipments created!...'


