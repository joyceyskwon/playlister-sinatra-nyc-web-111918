class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    full_name = self.name.downcase
    full_name.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    artist_name = slug.split("-").map {|w| w.capitalize!}.join(" ")
    Artist.find_by(name: artist_name)
  end

end # end of Artist class
