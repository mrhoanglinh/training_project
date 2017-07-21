# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "カテゴリ1")
Category.create(name: "カテゴリ2")
Category.create(name: "カテゴリ3")

blog_arr = []
(1..21).each do |i|
  blog_arr << Blog.create( title: "ブログ管理",
                          category_id: rand(1..3),
                          isSuggest: rand(0..1),
                          isPublic: rand(0..1),
                          remote_image_url: "http://res.cloudinary.com/dps1gf8le/image/upload/v1499305820/i2bft7nxgthm5mayzwnx.jpg",
                          content: "contents",
                          author: "ナルフォード",
                          jobName: "塾講師",
                          age: 26,
                          remote_authorImage_url: "http://res.cloudinary.com/dps1gf8le/image/upload/v1499305820/i2bft7nxgthm5mayzwnx.jpg",
                          datePublic: "19/07/2017".to_date)
end

