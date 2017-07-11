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

Answer.create([
  {id: 1, answer: 'Board Game'},
  {id: 2, answer: 'Go Biking'},
  {id: 3, answer: 'Painting'},
  {id: 4, answer: 'Gaming'},
  {id: 5, answer: 'Knit Something'},
  {id: 6, answer: 'Write an Algorithm'},
  {id: 7, answer: 'Go Out'},
  {id: 8, answer: 'Stay In'},
  {id: 9, answer: 'Charity Bike Race'},
  {id: 10, answer: 'Write Novel'},
  {id: 11, answer: 'Dancing'},
  {id: 12, answer: 'Walking on the Beach'},
])

Keyword.create([
  {id: 1, answer_id: 1, keyword: 'Gaming', weight: 6},
  {id: 2, answer_id: 2, keyword: 'Physical', weight: 6},
  {id: 3, answer_id: 3, keyword: 'Artistic', weight: 6},
  {id: 4, answer_id: 4, keyword: 'Gaming', weight: 3},
  {id: 5, answer_id: 5, keyword: 'Artistic', weight: 6},
  {id: 6, answer_id: 6, keyword: 'Science', weight: 6},
  {id: 7, answer_id: 7, keyword: 'Social', weight: 6},
  {id: 8, answer_id: 8, keyword: 'Introverted', weight: 6},
  {id: 9, answer_id: 9, keyword: 'Charity', weight: 6},
  {id: 10, answer_id: 10, keyword: 'Creative', weight: 6},
  {id: 11, answer_id: 11, keyword: 'Active', weight: 6},
  {id: 12, answer_id: 12, keyword: 'Active', weight: 6},

])

Question.create([
  {id: 1,  order: 1, question: 'Play a board game or go biking?', answer_ids: [1, 2]},
  {id: 2,  order: 2, question: 'Painting or gaming?', answer_ids: [3, 4]},
  {id: 3,  order: 3, question: 'Knit something or write an algorithm?', answer_ids: [5, 6]},
  {id: 4,  order: 4, question: 'Go out or stay in?', answer_ids: [7, 8] },
  {id: 5,  order: 5, question: 'Charity bike race or write novel?', answer_ids: [9, 10]},
  {id: 6,  order: 6, question: 'Dancing or walking on the beach?', answer_ids: [11, 12]},
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
