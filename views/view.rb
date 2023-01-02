class View
  def ask_user_for(question)
    puts question
    print "> "
    gets.chomp
  end
def display(movies)
  movies.each_with_index do |movie, i|
    puts "#{movie.id ? movie.id : i + 1}. #{movie.name} (#{movie.year}) [rating: #{movie.rating}]"
    end
end
end
