class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(file)
    info = file.split(/ - /)
    ## info array has artist name at index 0, song name at index 1
    song = self.new(info[1])
    song.artist_name = info[0]
    song
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    self.artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

end