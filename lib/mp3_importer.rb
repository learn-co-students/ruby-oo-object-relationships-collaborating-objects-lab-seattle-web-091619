class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # Dir is a class with entires method that can be passed a given directory which is our path
    # Returns an array containing all filenames in the given directory
    # Goal is to select entries containing .mp3, so use select enumerator on the returned array of filenames
    Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end

  def import 
    files.each { |file| Song.new_by_filename(file)}
  end

end