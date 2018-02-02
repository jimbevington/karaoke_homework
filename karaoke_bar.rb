require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')

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

  def create_room(name)
    @rooms.push(Room.new(name))
  end

  def create_guest(name)
    @guests.push(Guest.new(name))
  end

end
