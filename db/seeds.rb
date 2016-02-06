# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "Canoe", capacity: 65)

Restaurant.create(name: "Banjara", capacity: 45)

Restaurant.create(name: "Khao San Road", capacity: 25)

Restaurant.create(name: "Pizzeria Libretto", capacity: 37)

User.create(
  first_name: "Carlos",
  last_name: "Lozano",
  password_digest: "123123",
  email: "charleslozano@gmail.com"
 )
