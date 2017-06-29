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

Question.create([
  {id: 1, title: 'Would you rather play a board game or go biking?', backgroundImage: 'sampleimage.jpg')},
  {id: 2, title: 'Do you prefer painting or gaming?', backgroundImage: 'sampleimage2.jpg')},
  {id: 3, title: 'Would you rather knit something or write an algorithm?', backgroundImage: 'sampleimage3.jpg')},
  {id: 4, title: 'Do you prefer to go out or stay in?', backgroundImage: 'sampleimage4.jpg')}
  {id: 4, title: 'Would you rather go to the a nude bike ride to raise awareness or write a novel?', backgroundImage: 'sampleimage5.jpg')}
])

Answer.create([
  {id: 1, title: 'Yahtzee!', icon: 'board_game.jpg'},
  {id: 2, title: 'Painting!', icon: 'paintbrush.jpg'},
  {id: 3, title: 'Gaming!', icon: 'video_game.jpg'},
  {id: 4, title: 'Write code!', icon:'binary_code.jpg'},
  {id: 5, title: 'Biking!', icon: 'bicycle.jpg'},
  {id: 6, title: 'Knitting!', icon: 'knitting_needles.jpg'}
  {id: 7, title: 'Naked Biking for Awareness!', icon: 'blurred_bikers.jpg'}
  {id: 8, title: 'Write a novel!', icon: 'coffee_and_typewriter.jpg'}
])

Keyword.create([
  {id: 1, word: 'crafty', weight: 6},
  {id: 2, word: 'outdoorsy', weight: 8},
  {id: 3, word: 'nerdyAF', weight: 8},
  {id: 4, word: 'progressive/activist', weight: 10},
  {id: 5, word: 'fit', weight: 5}
  ])

Officer.create([
  {id: 1, first: 'Nick', last: 'Vasicek', phone: '555-555-5555', email: 'nick@email.com'},
  {id: 2, first: 'Charlie', last: 'Hanacek', phone: '555-555-5555', email: 'charlie@email.com'},
  {id: 3, first: 'Tyler', last: 'Walker', phone: '555-555-5555', email: 'tyler@email.com'}
  ])

Rso.create([
  {id: 1, name: 'Association of Computer Machinery', nickname: 'ACM', officer_ids: [1, 2], keyword_ids: [3], keyword_weights: [7]},
  {id: 2, name: 'Linux Users Group', nickname: 'LUG', officer_ids: [1, 2, 3], keyword_ids: [3], keyword_weights: [9]},
  {id: 3, name: 'Knitting Club', nickname: 'KNIT', officer_ids: [2], keyword_ids: [1, 2], keyword_weights: [7, 1]},
  {id: 4, name: 'Mountain Biking Club', nickname: 'MBC', officer_ids: [1, 2], keyword_ids: [2], keyword_weights: [6]}
  ])
>>>>>>> 319c9c202264785e094863eedd7f6ee73d55d8a6
