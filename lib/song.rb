class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
    else
      genre.songs << self
    end
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

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      @name
    else
      self.create(name)
    end
  end

  def self.new_from_filename(single_file)
    file_array = single_file.split(" - ")
    new_song = self.new(file_array[1])
    new_song.artist = Artist.find_or_create_by_name(file_array[0])
    new_song.genre = Genre.find_or_create_by_name(file_array[2].chomp(".mp3"))
    new_song
  end

  def self.create_from_filename(single_file)
    self.new_from_filename(single_file).save
  end
end
