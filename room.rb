class Room

  attr_reader :name, :guests, :songs

  def initialize(name)
    @name = name
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

end
