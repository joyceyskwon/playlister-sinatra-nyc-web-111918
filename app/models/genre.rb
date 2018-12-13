class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    full_name = self.name.downcase
    full_name.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    genre_name = slug.split("-").map {|w| w.capitalize!}.join(" ")
    Genre.find_by(name: genre_name)
  end

end # end of Genre class
