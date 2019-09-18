class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    # artist - title - genre.mp3
    artist = filename.split(" - ")[0]
    track = filename.split(" - ")[1]
    song = Song.new(track)
    song.artist_name = artist
    song
  end
end
