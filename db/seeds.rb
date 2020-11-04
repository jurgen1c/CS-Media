# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Type.create(name: 'Sports')
Type.create(name: 'Entertainment')
Type.create(name: 'Tech')
Type.create(name: 'Politics')
Type.create(name: 'Business')
Type.create(name: 'Fashion')
Type.create(name: 'Travel')

User.create(name: 'Sanad', username: 'Sandoog', email: 'sanad@sandoog.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Obama', username: 'Obamama', email: 'obama@obamama.com', password: '654321', password_confirmation: '654321')

10.times do |_i|
  User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.unique.username,
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
  title:'test', 
  user_id:'1', 
  type_id: '2', 
  body: 'Test body for first article',
  sources_attributes: [
      {
        title: 'test source',
        body: 'testiing sources seed',
        article_id: '1'
      }
    ] 
  )

2.times do |_i|
  article = Article.new
  article.title = Faker::Lorem.sentence
  article.body = Faker::Lorem.paragraph_by_chars(number: 300)
  article.author = User.first
  article.save
end
