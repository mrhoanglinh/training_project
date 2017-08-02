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

(1..21).each do |i|
  blog = Blog.create( title: "ブログ管理#{i}",
                          category_id: rand(1..3),
                          isSuggest: rand(0..1),
                          isPublic: rand(0..1),
                          remote_image_url: "http://www.pngall.com/wp-content/uploads/2016/07/Plants-PNG-Clipart.png",
                          content: "contents",
                          author: "ナルフォード",
                          jobName: "塾講師",
                          age: 26,
                          remote_authorImage_url: "http://www.pngall.com/wp-content/uploads/2016/07/Plants-PNG-Clipart.png",
                          datePublic: "19/07/2017".to_date)
end

(1..10).each do |i|
  user = User.create(email: "admin#{i}@gmail.com", password: "123456")
end

(1..10).each do |j|
  comment = Comment.create(blog_id: rand(1..23),
                           user_id: rand(1..12),
                       content: "user - comment #{j}")
end