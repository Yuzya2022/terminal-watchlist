require_relative "../models/movie"
require_relative "../views/view"
require_relative "../api/service"

class Controller
  def initialize(movie_repository)
    @movie_repository = movie_repository
    @view = View.new
  end

def add
  name = @view.ask_user_for("What is the name of the movie?")
  description = @view.ask_user_for("What is the movie about?")
  rating = @view.ask_user_for("How would you rate the movie out of 10?").to_f
  year = @view.ask_user_for("What is the movie released year?")
  movie = Movie.new({
     name: name,
     description: description,
     rating: rating,
     year: year
     })
  @movie_repository.create(movie)
  display_movies
end

def import
# Get the name of a film to search the API save to variable called query
query = @movies_view.ask_user_for("What is the name of the movie?")

# query the api and capture the response.
# display the response to the user.
# Give the user a message about selecting the data.
# use an until loop to allow the user to select multiple movies.
end

def list
  display_movies
end

private

  def display_movies
    movies = @movie_repository.all
    @view.display(movies)
end
