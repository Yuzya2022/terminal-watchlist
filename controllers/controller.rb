require_relative "../models/movie"
require_relative "../views/view"
require_relative "../api/movies_api"

class Controller
  def initialize(movie_repository)
    @movie_repository = movie_repository
    @view = View.new
    @movies_api = MoviesApi.new
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
query = @view.ask_user_for("What is the name of the movie?")

results = @movies_api.query(query)
    # display the response to the user.
    @view.display(results)
    # Give the user a message about selecting the data.
    finish = false
    puts "Please select a movie you would like to save?"
    puts "Once you have selected all of the movies you would like to save, type exit"
    # use an until loop to allow the user to select multiple movies.
    until finish
      print "> "
      selection = gets.chomp
      if selection == "exit"
        finish = true
      else
        film = results[selection.to_i - 1]
        @movie_repository.create(film)

        puts "You have saved: #{film.name}"
        puts "Please select another film to save or 'exit'"
      end
    end
end

def list
  display_movies
end

private

  def display_movies
    movies = @movie_repository.all
    @view.display(movies)
  end
end
