# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sports = Type.new(name: 'Sports')
sports.background.attach(
    io: File.open('app/assets/images/backgrounds/sports_bg.jpg'),
    filename: 'sports_bg.jpg',
    content_type: 'image/jpg'
  )
sports.save
entertainment = Type.new(name: 'Entertainment')
entertainment.background.attach(
    io: File.open('app/assets/images/backgrounds/entertainment_bg.jpg'),
    filename: 'entertainment_bg.jpg',
    content_type: 'image/jpg'
  )
entertainment.save
tech = Type.new(name: 'Tech')
tech.background.attach(
    io: File.open('app/assets/images/backgrounds/tech_bg.jpg'),
    filename: 'tech_bg.jpg',
    content_type: 'image/jpg'
  )
tech.save
politics = Type.new(name: 'Politics')
politics.background.attach(
    io: File.open('app/assets/images/backgrounds/politics_bg.jpg'),
    filename: 'politics_bg.jpg',
    content_type: 'image/jpg'
  )
politics.save
business = Type.new(name: 'Business')
business.background.attach(
    io: File.open('app/assets/images/backgrounds/business_bg.jpg'),
    filename: 'business_bg.jpg',
    content_type: 'image/jpg'
  )
business.save
fashion = Type.new(name: 'Fashion')
fashion.background.attach(
    io: File.open('app/assets/images/backgrounds/fashion_bg.jpg'),
    filename: 'fashion_bg.jpg',
    content_type: 'image/jpg'
  )
fashion.save
travel = Type.new(name: 'Travel')
travel.background.attach(
    io: File.open('app/assets/images/backgrounds/travel_bg.jpg'),
    filename: 'travel_bg.jpg',
    content_type: 'image/jpg'
  )
travel.save

User.create(name: 'Sanad', username: 'Sandoog', bio: Faker::Lorem.paragraph_by_chars(number: 200), email: 'sanad@sandoog.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Obama', username: 'Obamama', bio: Faker::Lorem.paragraph_by_chars(number: 150), email: 'obama@obamama.com', password: '654321', password_confirmation: '654321')

10.times do |_i|
  User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.unique.username,
    bio: Faker::Lorem.paragraph,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
    )
end

Following.create(user_id: 1, follow_id: 2)
Following.create(user_id: 2, follow_id: 1)
Following.create(user_id: 3, follow_id: 1)
Following.create(user_id: 4, follow_id: 1)
Following.create(user_id: 5, follow_id: 1)

Article.create(
  title: Faker::Lorem.sentence, 
  user_id:'1', 
  type_id: '2', 
  body: Faker::Lorem.paragraph_by_chars(number: 370),
  sources_attributes: [
      {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph_by_chars(number: 150),
        article_id: '1'
      }
    ] 
  )

7.times do |_i|
  article = Article.create!(
    title: Faker::Lorem.sentence, 
    user_id: User.first.id, 
    type_id: "#{rand(1..7)}", 
    body: Faker::Lorem.paragraph_by_chars(number: 550),
    sources_attributes: [
      {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph_by_chars(number: 300)
      }
    ]
  )
  article.sources.first.article_id = article.id
end

7.times do |_i|
  article = Article.new(
    title: Faker::Lorem.sentence, 
    user_id: User.second.id, 
    type_id: "#{rand(1..7)}", 
    body: Faker::Lorem.paragraph_by_chars(number: 600),
    sources_attributes: [
      {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph_by_chars(number: 350)
      }
    ]
  ) 
  article.sources.first.article_id = article.id
  article.save
end

7.times do |_i|
  article = Article.new(
    title: Faker::Lorem.sentence, 
    user_id: User.third.id, 
    type_id: "#{rand(1..7)}", 
    body: Faker::Lorem.paragraph_by_chars(number: 450),
    sources_attributes: [
      {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph_by_chars(number: 150)
      }
    ]
  )
  article.sources.first.article_id = article.id 
  article.save
end

7.times do |_i|
  article = Article.new(
    title: Faker::Lorem.sentence, 
    user_id: User.fourth.id, 
    type_id: "#{rand(1..7)}", 
    body: Faker::Lorem.paragraph_by_chars(number: 500),
    sources_attributes: [
      {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph_by_chars(number: 250)
      }
    ]
  )
  article.sources.first.article_id = article.id 
  article.save
end

10.times do |_i|
  user = 1
  Vote.create(user_id: user, article_id: 1)
  user += 1
end

7.times do |_i|
  user = 1
  Vote.create(user_id: user, article_id: 10)
  user += 1
end

5.times do |_i|
  user = 1
  Vote.create(user_id: user, article_id: 15)
  user += 1
end

4.times do |_i|
  user = 1
  Vote.create(user_id: user, article_id: 5)
  user += 1
end

2.times do |_i|
  user = 1
  Vote.create(user_id: user, article_id: 22)
  user += 1
end
