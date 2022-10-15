# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all
puts 'Creating the movies'

# Api key Example
# https://api.themoviedb.org/3/movie/550?api_key=aaae9f29e0cc89950560a49ffc23f4a6

# api_key = 'aaae9f29e0cc89950560a49ffc23f4a6'


url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie_data = JSON.parse(movie_serialized)
movies = movie_data['results']

20.times do |i|
  Movie.create!(
    title: movies[i - 1]['original_title'],
    overview: movies[i - 1]['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movies[i - 1]['poster_path']}",
    rating: movies[i - 1]['vote_average']
  )
end
