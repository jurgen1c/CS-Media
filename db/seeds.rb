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

User.create(name: 'Sanad', username: 'Sandoog', email: 'sanad@sandoog.com', password: '123456')