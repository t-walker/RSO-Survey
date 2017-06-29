# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Answer.destroy_all
Keyword.destroy_all
Officer.destroy_all
Question.destroy_all
Rso.destroy_all

Question.create([
  {id: 1, question: 'Play a board game or go biking?'},
  {id: 2, question: 'Painting or gaming?'},
  {id: 3, question: 'Knit something or write an algorithm?'},
  {id: 4, question: 'Go out or stay in?'},
  {id: 5, question: 'Nude bike ride to raise awareness or write a novel?'},
  {id: 6, question: 'Dancing or walking on the beach?'},
  {id: 7, question: 'Watching a movie or making your own?'},
  {id: 8, question: 'Learn martial arts or how to quilt?'},
  {id: 9, question: 'Discuss religion or politics?'},
  {id: 10, question: 'Learn another language or work in a laboratory?'},
  {id: 11, question: 'Design and create a robot or bake a cake?'},
  {id: 12, question: 'Play a board game or go target shooting?'},
  {id: 13, question: 'Raise awareness about the environment or have a debate?'},
  {id: 14, question: 'Tend a garden or play an online game?'},
  {id: 15, question: 'Theorize about physics or have a nerf war?'},
  {id: 16, question: 'Rock climb or play music?'},
  {id: 17, question: 'Study rocks or learn to shoot a bow?'},
  {id: 18, question: 'Produce music or discuss current events?'},
  {id: 19, question: 'Try a new food or watch a new movie?'},
  #{id: 20, question: ''},
  #{id: 21, question: ''},
  #{id: 22, question: ''},
  #{id: 23, question: ''},
  #{id: 24, question: ''},
  #{id: 25, question: ''}
  
])

Answer.create([
  {id: 1, answer: 'Yahtzee!'},
  {id: 2, answer: 'Painting!'},
  {id: 3, answer: 'Gaming!'},
  {id: 4, answer: 'Write code!'},
  {id: 5, answer: 'Biking!'},
  {id: 6, answer: 'Knitting!'},
  {id: 7, answer: 'Naked Biking for Awareness!'},
  {id: 8, answer: 'Write a novel!'},
  {id: 9, answer: 'Dancing!'},
  {id: 10, answer: 'Walk on the beach!'},
  {id: 11, answer: 'Watch a movie!'},
  {id: 12, answer: 'Make my own!'},
  {id: 13, answer: 'Martial Arts!'},
  {id: 14, answer: 'Quilting!'},
  {id: 15, answer: 'Religion!'},
  {id: 16, answer: 'Politics!'},
  {id: 17, answer: 'Learn another language!'},
  {id: 18, answer: 'Work in a lab!'},
  {id: 19, answer: 'Make a robot!'},
  {id: 20, answer: 'Bake a cake!'},
  {id: 21, answer: 'Board game!'},
  {id: 22, answer: 'Shooting!'},
  {id: 23, answer: 'Raise environmental awareness!'},
  {id: 24, answer: 'Debate!'},
  {id: 25, answer: 'Theorize about physics!'},
  {id: 26, answer: 'Tend a garden!'},
  {id: 27, answer: 'Online game!'},
  {id: 28, answer: 'Nerf war!'},
  {id: 29, answer: 'Rock climb!'},
  {id: 30, answer: 'Play music!'},
  {id: 31, answer: 'Study rocks!'},
  {id: 32, answer: 'Shoot a bow!'},
  {id: 33, answer: 'Produce a fat beat!'},
  {id: 34, answer: 'Discuss current events!'},
  {id: 35, answer: 'Try new food!'},
  {id: 36, answer: 'Watch a new movie!'}
])

Keyword.create([
  {id: 1, keyword: 'Crafty', weight: 6},
  {id: 2, keyword: 'Outdoorsy', weight: 8},
  {id: 3, keyword: 'NerdyAF', weight: 8},
  {id: 4, keyword: 'Progressive/activist', weight: 10},
  {id: 5, keyword: 'Fit', weight: 5},
  {id: 6, keyword: 'Thrilling', weight: 9},
  {id: 7, keyword: 'Adventurous', weight: 8},
  {id: 8, keyword: 'LGBTQ', weight: 7},
  {id: 9, keyword: 'Food', weight: 5},
  {id: 10, keyword: 'Martial Arts', weight: 8},
  {id: 11, keyword: 'Arts', weight: 5},
  {id: 12, keyword: 'Science', weight: 7},
  {id: 13, keyword: 'Engineering', weight: 7},
  {id: 14, keyword: 'Crime', weight: 6},
  {id: 15, keyword: 'Film', weight: 4},
  {id: 16, keyword: 'Photography', weight: 4},
  {id: 17, keyword: 'Shooting', weight: 8},
  {id: 18, keyword: 'Multi Cultural', weight: 4},
  {id: 19, keyword: 'Religious', weight: 9},
  {id: 20, keyword: 'Dance', weight: 5},
  {id: 21, keyword: 'Programming', weight: 8}
  ])

Officer.create([
  {id: 1, first: 'Nick', last: 'Vasicek', phone: '555-555-5555', email: 'nick@email.com'},
  {id: 2, first: 'Charlie', last: 'Hanacek', phone: '555-555-5555', email: 'charlie@email.com'},
  {id: 3, first: 'Tyler', last: 'Walker', phone: '555-555-5555', email: 'tyler@email.com'}
  ])

Rso.create([
  {id: 1, name: 'Association of Computer Machinery', nickname: 'ACM', officer_ids: [1, 2]},
  {id: 2, name: 'Linux Users Group', nickname: 'LUG', officer_ids: [1, 2, 3]},
  {id: 3, name: 'Knitting Club', nickname: 'KNIT', officer_ids: [2]},
  {id: 4, name: 'Mountain Biking Club', nickname: 'MBC', officer_ids: [1, 2]},
  {id: 5, name: 'Sportsmans club', nickname: 'SC', officer_ids: [1, 2]},
  {id: 6, name: 'Black Student Union', nickname: 'BSU', officer_ids: [1, 2]},
  {id: 7, name: 'Geology Club', nickname: 'WSUGeoClub', officer_ids: [1, 2]},
  {id: 8, name: 'Sports Management Club', nickname: '', officer_ids: [1, 2]},
  {id: 9, name: 'Environmental Science Club', nickname: 'ESC', officer_ids: [1, 2]},
  {id: 10, name: 'The Criminal Justice Club', nickname: 'CJ Club', officer_ids: [1, 2]},
  {id: 11, name: 'Humans vs Zombies', nickname: 'HvZ', officer_ids: [1, 2]},
  {id: 12, name: 'Physics and Astronomy Club', nickname: 'Physics', officer_ids: [1, 2]},
  {id: 13, name: 'Floor Hockey Club', nickname: 'Floor Hockey', officer_ids: [1, 2]},
  {id: 14, name: 'Smash Bros Club', nickname: 'SBC', officer_ids: [2, 3]},
  {id: 15, name: 'Digital Media Club', nickname: 'DMC', officer_ids: [3]},
  {id: 16, name: 'Biology Club', nickname: 'Bio Club', officer_ids: [2]},
  {id: 17, name: 'Pre Law Society', nickname: 'PLS', officer_ids: [2]},
  {id: 18, name: 'Food Science Club', nickname: 'FS Club', officer_ids: [1]},
  {id: 19, name: 'Horticulture Club', nickname: 'Hort Club', officer_ids: [3]},
  {id: 20, name: 'Judo Club', nickname: 'Judo @ WSU', officer_ids: [1, 3]},
  {id: 21, name: 'Low Brass Collective', nickname: 'LBC', officer_ids: [3, 2]},
  {id: 22, name: 'Archery Club', nickname: 'Archery', officer_ids: [1]},
  {id: 23, name: 'WSU Chess', nickname: 'WSUC', officer_ids: [2]},
  {id: 24, name: 'Latin Dance Club', nickname: 'LDC', officer_ids: [1]},
  {id: 25, name: 'Cougs in Space', nickname: 'CiS', officer_ids: [2]},
  {id: 26, name: 'Esports and Gaming', nickname: 'EGWSU', officer_ids: [1, 2, 3]},
  {id: 27, name: 'Political Science Club', nickname: 'PSCWSU', officer_ids: [1, 2, 3]}
  ])