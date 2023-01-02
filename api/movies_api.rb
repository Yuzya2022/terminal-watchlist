require_relative "../models/movie"
require "json"
require "open-uri"

class MoviesApi
  def query(query)
    apiKey = "f56ed8a3157d8c61b0f7d51eb903afae"
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{apiKey}&query=#{query}"
    movie_serilalized = URI.open(url).read
    response = JSON.parse(movie_serilalized)["results"]
    filter_response(response)
  end

  private

  def filter_response(data)
    data.map do |film|
      Movie.new({
        name: film["original_title"],
        description: film["overview"],
        rating: film["vote_average"],
        year: film["release_date"].split("-").first
      })
    end
end
