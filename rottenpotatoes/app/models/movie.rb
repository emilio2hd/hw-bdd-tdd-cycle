class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_all_director_by(director)
    return Movie.where(director: director)
  end
end
