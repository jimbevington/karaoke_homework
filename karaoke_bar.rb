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

  def guest_can_afford_room(guest, room)
    if guest.money >= room.price
      return true
    else
      p "HEY!!! This costs £#{room.price}, you've only got £#{guest.money}."
      return false
    end
  end

  def room_has_space(room)
    if room.guests.count < room.capacity
      return true
    else
      p "We're full!"
      return false
    end
  end

  def deduct_money(guest, amount)
    guest.spend_money(amount)
  end

  def check_in(guest, room)
    if guest_can_afford_room(guest, room) && room_has_space(room)
      room.add_guest(guest)
      deduct_money(guest, room.price)
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
