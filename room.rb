class Room

  attr_reader :name, :capacity, :guests, :songs

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    # both GUESTS and SONGS are added by the Karaoke bar
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def remove_song(song)
    @songs.delete(song)
  end



end
