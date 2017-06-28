# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Answer.delete_all
ApplicationRecord.delete_all
Keyword.delete_all
Officer.delete_all
Question.delete_all
Rso.delete_all

rso.create!(name: 'Association for Computer Machinery',
            shortName: 'ACM',
            category: 'Computer Science')

rso.create!(name: 'Knitting Club',
            shortName: 'KNIT',
            category: 'Special Interest')

rso.create!(name: 'Mountain Biking Club',
            shortName: 'MBC',
            category: 'Workout')

question.create!(title: 'Would you rather watch a movie or go bowling?'
                 backgroundImage: 'sampleimage.jpeg')

answer.create!(title: 'Dim the lights.'
               icon: 'movie_picture.jpeg')

Answer.create!(title: 'Ill get my shoes!')

Keyword.create!(word: 'crafty')

Keyword.create!(word: 'outdoorsy')

Keyword.create!(word: 'nerdyAF')

Officer.create!(firstName: 'Tyler'
	            lastName: 'Walker'
	            email: 'tyler.p.walker@wsu.edu'
	            phone: '2061234567')