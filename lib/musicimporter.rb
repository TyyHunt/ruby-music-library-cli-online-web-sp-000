class MusicImporter

attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def path
    File.path(@path)
  end

  def files
    Dir.entries(@path).select {|song| song.end_with?(".mp3")}
  end

  def import
    import_list = []
    files.each {|song| import_list << Song.create_from_filename(song)}
  end

end
