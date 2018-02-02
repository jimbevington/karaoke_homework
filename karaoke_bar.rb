class KaraokeBar

  attr_reader :name, :guests, :songs, :rooms

  def initialize(name)
    @name = name
    # starts with no songs, rooms or guests.
    # the bar CREATES them
    @guests = []
    @songs = []
    @rooms = []
  end

  def create_song(name, artist)
    @songs.push(Song.new(name, artist))
  end

end
