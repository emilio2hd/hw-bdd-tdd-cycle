class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_all_director_by(movie_id)
    movie = find_by_id movie_id

    raise ArgumentError, "'#{movie.title}' has no director info" if "#{movie.director}".empty?

    return Movie.where(director: movie.director)
  end
end
