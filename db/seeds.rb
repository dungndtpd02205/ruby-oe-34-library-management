# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  id = n+1
  User.create!(full_name: "User #{n}",
    email: "Email#{n}.@gmail.com", password: "123456")
  Author.create!(full_name: "Mr.#{n}",
    birth_day: Time.zone.now)
  Publisher.create!(name: "Publisher.#{n}")
  Categories.create!(name: "Cate.#{n}")
  Book.create!(name: "Book part #{n}",
    categories_id: id, publisher_id: id,
    author_id: id, publish_day: Time.zone.now,
    quantity: 2, num_of_pages: 100)
end
