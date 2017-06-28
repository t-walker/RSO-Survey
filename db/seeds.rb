# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD

Answer.delete_all
ApplicationRecord.delete_all
Keyword.delete_all
Officer.delete_all
Question.delete_all
Rso.delete_all

question.create!(title: 'Would you rather watch a movie or go bowling?'
                 backgroundImage: 'sampleimage.jpg')

question.create!(title: 'Do you prefer painting or gaming?'
                 backgroundImage: 'sampleimage.jpg')


answer.create!(title: 'Dim the lights and start popping the corn.'
               icon: 'movie_picture.jpeg')

answer.create!(title: 'Painting!'
               icon: 'paintbrush.jpeg')

answer.create!(title: 'Gaming!'
               icon: 'video_game_picture.jpeg')

Answer.create!(title: 'Ill get my shoes!')

Keyword.create!(word: 'crafty')

Keyword.create!(word: 'outdoorsy')

Keyword.create!(word: 'nerdyAF')

Officer.create([
  {id: 1, first: 'Nick', last: 'Vasicek', phone: '555-555-5555', email: 'nick@email.com'},
  {id: 2, first: 'Charlie', last: 'Hanacek', phone: '555-555-5555', email: 'charlie@email.com'},
  {id: 3, first: 'Tyler', last: 'Walker', phone: '555-555-5555', email: 'tyler@email.com'}
  ])

Rso.create([
  {id: 1, name: 'Association of Computer Machinery', nickname: 'ACM', officer_ids: [1, 2], category: 'Special Interest'},
  {id: 2, name: 'Linux Users Group', nickname: 'LUG', officer_ids: [1, 2, 3], category: 'Special Interest'},
  {id: 3, name: 'Knitting Club', nickname: 'Knit', officer_ids: [2], category: 'Special Interest'},
  {id: 4, name: 'Mountain Biking Club', nickname: 'MBC', officer_ids: [1, 2], category: 'Workout'}

  ])
>>>>>>> 319c9c202264785e094863eedd7f6ee73d55d8a6
