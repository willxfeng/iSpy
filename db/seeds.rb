# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
arts = [
  ["Man with Beard", "Boston, MA", "On the corner of Mass Ave and Comm Ave", "Graffiti", "Anonymous", 3],
  ["Lily", "Boston, MA", "On the corner of Mass Ave and Comm Ave", "Graffiti", "Anonymous", 3],
  ["Chelsea", "Boston, MA", "On the corner of Mass Ave and Comm Ave", "Graffiti", "Anonymous", 3],
  ["The Hackstreet Boys", "Boston, MA", "On the corner of Mass Ave and Comm Ave", "Graffiti", "Anonymous", 3],
  ["John with Beard", "Boston, MA", "The Hackstreet Boys", "Graffiti", "Anonymous", 3],
  ["Will with Beard", "Boston, MA", "On the corner of Mass St and Comm Ave", "Graffiti", "Anonymous", 3],
  ["Lily with Beard", "Boston, MA", "The Hackstreet Boys St", "Graffiti", "Anonymous", 3],
  ["Chelsea with Beard", "Boston, MA", "The Hackstreet Boys Ave", "Graffiti", "Anonymous", 3],
  ["Elise with Beard", "Boston, MA", "The Hackstreet Boys Dr", "Graffiti", "Anonymous", 3]
]

arts.each do |art_info|
  name, location, description, category, artist, average_rating = art_info
  Art.create!(name: name, location: location, description: description, category: category, artist: artist, average_rating: average_rating)
end

reviews = [
  ["So cool", 5, 3, 3],
  ["So cool", 5, 2, 1],
  ["So cool", 5, 2, 2],
  ["So cool", 5, 3, 5],
  ["So cool", 5, 1, 1]
]

reviews.each do |review_info|
  body, rating, art_id, user_id = review_info
  Review.create!(body: body, rating: rating, art_id: art_id, user_id: user_id)
end
