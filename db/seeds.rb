# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create(
    name: "A"
)
Genre.create(
    name: "B"
)
Genre.create(
    name: "C"
)

Item.create(
    genre_id: 1,
    name: "aaa",
    description: "this is aaa",
    price: 100
)
Item.create(
    genre_id: 2,
    name: "bbb",
    description: "this is bbb",
    price: 200
)
Item.create(
    genre_id: 3,
    name: "ccc",
    description: "this is ccc",
    price: 300
)