class Movie
  attr_accessor :name, :title, :time

  def initialize(name, title, time)
    @name = name
    @title = title
    @time = time
  end
end

module MyEnumerable
  def my_select
    puts "Start my_select"

    new_array = []
    each do |movie|
      puts "my_select each #{movie.name}"
      new_array << movie if yield(movie)
    end

    puts "Finish my_select"
    new_array
  end

  def my_map
    puts "Start my_map"

    new_array = []
    each do |movie|
      puts "my_map each"
      new_array << yield(movie)
    end

    puts "Finish my_select"    
    new_array
  end
end

class MovieQueue
  include MyEnumerable

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movies(movie)
    @movies << movie
  end

  def each
    puts "MovieQueue each start"

    @movies.each do |m|
      puts "MovieQueue each"
      yield m
    end

    puts "MovieQueue each finish"
  end
end

movie1 = Movie.new("Toy story 1", "+6", 81)
movie2 = Movie.new("Toy story 2", "+12", 140)
movie3 = Movie.new("Toy story 3", "+18", 155)

queue = MovieQueue.new("Friday Night")
queue.add_movies(movie1)
queue.add_movies(movie2)
queue.add_movies(movie3)

long_movies = queue.my_select { |m| m.time >= 100 }
p long_movies

titles = queue.my_map { |m| m.name.downcase }
p titles
