# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'





#   validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :address, presence: true
#   validates :avatar, presence: true
#   validates :email, presence: true, uniqueness: true
# end



# # create_table "users", force: :cascade do |t|
# #     t.string "first_name", null: false
# #     t.string "last_name", null: false
# #     t.string "address", null: false
# #     t.string "phone_number"
# #     t.boolean "owner", default: false
# #     t.string "avatar"
# #     t.string "email", default: "", null: false
# #     t.string "encrypted_password", default: "", null: false
# #     t.string "reset_password_token"
# #     t.datetime "reset_password_sent_at"
# #     t.datetime "remember_created_at"
# #     t.datetime "created_at", null: false
# #     t.datetime "updated_at", null: false
# #     t.index ["email"], name: "index_users_on_email", unique: true
# #     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# #   end

# #   add_foreign_key "equipment", "users"
# #   add_foreign_key "reservations", "equipment"
# #   add_foreign_key "reservations", "users"
# # end



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
end
