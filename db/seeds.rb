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
EndUser.create!(
    email: "a@a",
    last_name: "田中",
    first_name: "太郎",
    last_name_kana: "タナカ",
    first_name_kana: "タロウ",
    postal_code: "1234567",
    address: "住所が入ります",
    telephone_number: "12345678910",
    password: "aaaaaa"
)
Genre.create(
    name: "カテゴリーA"
)
Genre.create(
    name: "カテゴリーB"
)
Genre.create(
    name: "カテゴリーC"
)