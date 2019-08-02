# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 letter = Letter.create!(letter_number: "001", user_id: "1")
 letter.records.create!(name: "First Name 05", unit_value: 1029.95, quantity: 1, template: "aip1", user_id: "1")
 letter = Letter.create!(letter_number: "002", user_id: "1")
 letter.records.create!(name: "First Name 06", unit_value: 2024.99, quantity: 2, template: "aip1", user_id: "1")


