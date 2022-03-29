# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = [
  "https://m.media-amazon.com/images/I/51DZeZw7K0L.jpg",
  "https://m.media-amazon.com/images/M/MV5BZDViYmQ0YjUtNjJiZC00NDAxLWEwOTctYjhhYTcyYTk2NzFhXkEyXkFqcGdeQXVyMTMxMTY0OTQ@._V1_.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/51uDbir0FNL._SX318_BO1,204,203,200_.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81NuITyKhiL.jpg",
]

users = [
  User.create(username: "johndoe123", email: "johndoe123@google.com", password: "password"),
  User.create(username: "jimmyjohns456", email: "jimmyjohns456@google.com", password: "password"),
  User.create(username: "adminperson24", email: "admin@admin.com", password: "password")

]
(1..50).each do
  users[Random.rand(users.count)].Book.create(title: Faker::Book.title, description: Faker::Lorem.paragraph(sentence_count: 2), image_path: images[Random.rand(images.length)])
end
