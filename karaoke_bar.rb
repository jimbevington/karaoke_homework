require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')

class KaraokeBar

  attr_reader :name, :guests, :songs, :rooms

  def initialize(name, songs, rooms)
    @name = name
    @songs = songs
    @rooms = rooms
    @guests = []
  end

  def check_in(guest, room)
    room.add_guest(guest)
  end
  #
  def check_out(guest, room)
    # what if the guest isn't there
    room.remove_guest(guest)
  end

end
