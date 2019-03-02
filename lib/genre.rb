require_relative '../lib/concerns/findable.rb'

class Genre

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @name = self.new(name)
    @@all << @name
    @name
  end

  def add_song(song)
    if song.genre == self
    else
      @songs << song
      song.genre = self
    end
  end

  def artists
    artists = @songs.map {|song| song.artist}
    artists.uniq
  end

  def songs
    @songs
  end


end
