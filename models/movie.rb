class Movie
  attr_accessor :id
  attr_reader :name, :rating, :year, :description 

  def initialize(properties = {})
    @id = properties[:id]
    @name = properties[:name]
    @rating = properties[:rating]
    @year = properties[:year]
    @description = properties[:description]
  end
end
