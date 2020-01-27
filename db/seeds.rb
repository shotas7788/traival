# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
     User.create(
        name: Faker::JapaneseMedia::DragonBall.character,
        email: Faker::Internet.email,
        username: Faker::JapaneseMedia::OnePiece.character,
        password: Faker::Internet.password(min_length: 10, max_length: 20)
      )
end