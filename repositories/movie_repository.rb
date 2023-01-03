require "json"
require_relative "../models/movie"

class MovieRepository
  def initialize(json_file_path)
    @movies = []
    @json_file = json_file_path
    @movie_id = 1
    load_json if File.exist?(@json_file)
  end

def all
  @movies
end

def create(movie)
  movie.id = @movie_id
  @movie_id += 1
  @movies << movie
  save_json
end

def find(movie_id)
  @movies.find { |movie| movie.id == movie_id }
end

private

def save_json
  saved_data = @movies.map do |movie|
    {id: movie.id, name: movie.name, description: movie.description, rating: movie.rating, year: movie.year}
  end
  File.open(@json_file, "wb") do |file|
    file.write(JSON.generate(saved_data))
    end
end

def load_json
  serialized_movies = File.read(@json_file)
  movies = JSON.parse(serialized_movies, {symbolize_names: true})
  movies.each do |movie|
    @movies << Movie.new(movie)
  end
  @movie_id = @movies.last.id + 1
end
end
