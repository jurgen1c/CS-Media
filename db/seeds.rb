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

=begin 
e1 = Exhibit.create(
title: 'TITLE', 
author:  'PICASOO',
date_of_origin: '300', 
description: 'LOREM IPSUM', 
ex_id: '1',
type: nil,
questions_attributes: [
  { 
     content: 'Q1',
     answers_attributes: [
       {content: "A1", correct: false},
       {content: "A2", correct: true}
     ]
   }
 ]
) 
=end