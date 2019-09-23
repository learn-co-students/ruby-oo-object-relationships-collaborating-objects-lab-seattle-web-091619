class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    # Remember select returns an array so no need to initialize with an empty songs array
    Song.all.select { |song| song.artist == self}
  end

  def self.find_or_create_by_name(artist_name)
    self.all.find { |artist| artist.name == artist_name } || self.new(artist_name)
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

  def self.all
    @@all
  end

end