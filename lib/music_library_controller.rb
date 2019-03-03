class MusicLibraryController

  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    @path = file_path
    MusicImporter.new(@path).import
  end

  def call
    input = ''
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
    end
  end

  def list_songs
      song_list = Song.all.sort_by{|song| song.name}
      counter = 1
      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end

  def list_artists
    artist_list = Artist.all.sort_by{|song| song.name}
    counter = 1
    artist_list.uniq.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by{|song| song.name}
    counter = 1
    genre_list.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist != nil
      song_list = artist.songs.sort_by{|song| song.name}
      counter = 1
      song_list.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre != nil
      song_list = genre.songs.sort_by{|song| song.name}
      counter = 1
      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
      puts "Which song number would you like to play?"
      song_list = Song.all.sort_by{ |song| song.name}
      song_number = gets.chomp
      song_number = song_number.to_i
      if song_number.is_a? Integer
        if song_number > 0 && song_number <= song_list.length
          puts "Playing #{song_list[song_number - 1].name} by #{song_list[song_number - 1].artist.name}"
        end
      end
    end


  def call
    input = ''

      while input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp

        case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artists'
        self.list_artists
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      else
        "Type in a valid request please"
      end
    end

    end

end
