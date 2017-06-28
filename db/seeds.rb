# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Officer.destroy_all
Rso.destroy_all

Officer.create([
  {id: 1, first: 'Nick', last: 'Vasicek', phone: '555-555-5555', email: 'nick@email.com'},
  {id: 2, first: 'Charlie', last: 'Hanacek', phone: '555-555-5555', email: 'charlie@email.com'},
  {id: 3, first: 'Tyler', last: 'Walker', phone: '555-555-5555', email: 'tyler@email.com'}
  ])

Rso.create([
  {id: 1, name: 'Association of Computer Machinery', nickname: 'ACM', officer_ids: [1, 2]},
  {id: 2, name: 'Linux Users Group', nickname: 'LUG', officer_ids: [1, 2, 3]}
  ])
