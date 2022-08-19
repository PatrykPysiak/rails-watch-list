require 'net/http'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
url = 'https://tmdb.lewagon.com/movie/top_rated'

uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

# data['results'].each { |item| puts item['title']}
# data['results'].each { |item| puts item['overview']}
# data['results'].each { |item| puts item['vote_average']}
# data['results'].each { |item| puts "https://image.tmdb.org/t/p/original#{item['poster_path']}"}
data['results'].each do |item|
  puts "seeding: #{item['title']}..."
Movie.create(title: item['title'], overview: item['overview'], poster_url: "https://image.tmdb.org/t/p/original#{item['poster_path']}", rating: item['vote_average'])
  puts "done"
end
