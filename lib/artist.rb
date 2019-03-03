require_relative '../lib/concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre
  @@all = []

   def initialize(name)
    @name = name
    @songs = []
  end

   def self.all
    @@all
  end

   def self.destroy_all
    @@all.clear
  end

   def save
    @@all << self
    self
  end

  def self.create(name)
    @name = self.new(name)
    @name.save
    @name
  end

   def songs
    @songs
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == nil  
      song.artist = self
    end
  end

   def genres
    songs = @songs
    genres = songs.map {|song| song.genre}
    genres = genres.uniq
  end
end
