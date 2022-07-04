# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
email: "admin@test.jp",
password: "1qaz2wsx",
password_confirmation: "1qaz2wsx",
nickname: "admin",
admin: true
)
user.save!