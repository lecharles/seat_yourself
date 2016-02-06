# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.create(name: "Canoe", user_id: 1)

Restaurant.create(name: "Banjara", user_id: 2)

Restaurant.create(name: "Khao San Road", user_id: 1)

Restaurant.create(name: "Pizzeria Libretto", user_id: 2)

User.create(
  first_name: "Carlos",
  last_name: "Lozano",
  password_digest: "123123",
  email: "charleslozano@gmail.com"
 )
