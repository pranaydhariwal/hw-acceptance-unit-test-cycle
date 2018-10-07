class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def list_movies_with_simliar_director
    Movie.where("director=?",self.director)
  end
end
