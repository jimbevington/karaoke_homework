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
    if room.guests.count < room.capacity
      room.add_guest(guest)
    else
      p "Room Full. GET OUT!!!"
    end
  end
  #
  def check_out(guest, room)
    # what if the guest isn't there
    room.remove_guest(guest)
  end

  def add_songs(room, songs)
    if songs.class == Array
      # add all songs if its an array
      for song in songs
        room.add_song(song)
      end
    else
      # add a single song if not
      room.add_song(songs)
    end
  end
  # no brief to remove songs

end
