class Song < ActiveRecord::Base

  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    full_name = self.name.downcase
    full_name.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    song_title = slug.split("-").map {|w| w.capitalize!}.join(" ")
    Song.find_by(name: song_title)
  end

end # end of Song class
