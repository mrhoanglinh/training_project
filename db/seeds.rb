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

(1..40).each do |i|
  blog = Blog.create( title: "ブログ管理#{i}",
                      category_id: rand(1..3),
                      isSuggest: rand(0..1),
                      isPublic: rand(0..1),
                      remote_image_url: "http://www.pngall.com/wp-content/uploads/2016/07/Plants-PNG-Clipart.png",
                      content: "アメリカで１６日にち、「移民いみんがいない日ひ」という名前なまえのストライキがありました。
                      トランプ大統領だいとうりょうが出だした中東ちゅうとうなど７つの国くにの人ひとをしばらくアメリカに入いれない命令めいれいに反対はんたいするためです。
                      首都しゅとのワシントンでは、移民いみんが多おおく働はたらいているレストランなどがたくさん休やすみになりました。働はたらく人ひとの半分はんぶんがストライキをした店みせを経営けいえいする人ひとは「アメリカの経済けいざいには移民いみんが必要ひつようです」と言いっていました。
                      ストライキをした移民いみんたちはホワイトハウスの前まえに集あつまって、「私わたしは自分じぶんの権利けんりのために戦たたかいます。大統領だいとうりょうは法律ほうりつを守まもってほしいです」などと話はなしていました。
                      アメリカの中央銀行ちゅうおうぎんこうのトップのイエレン議長ぎちょうも、経済けいざいのために移民いみんが必要ひつようだと言いっています。",
                      author: "ナルフォード",
                      jobName: "塾講師",
                      age: 26,
                      remote_authorImage_url: "http://www.pngall.com/wp-content/uploads/2016/07/Plants-PNG-Clipart.png",
                      datePublic: "01/08/2017".to_date,
                      interest: 0,
                      like: 0,
                      dislike: 0,
                      disappoint: 0
                    )
end

(1..3).each do |v|
  user = User.create(email: "user#{v}@gmail.com", password: "123456")
end

Admin.create(email: "admin@gmail.com", password: "123456")

(1..100).each do |j|
  comment = Comment.create(blog_id: rand(1..10),
                           user_id: rand(1..12),
                           content: "user #{rand(1..10)} - comment #{j}")
end

(1..100).each do |x|
  bloguser = BlogUser.create(action: rand(1..4), blog_id: rand(42..44), user_id: rand(1..2))
end


