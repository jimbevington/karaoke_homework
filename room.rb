class Room

  attr_reader :name, :guests, :songs

  def initialize(name)
    @name = name
    # both GUESTS and SONGS are added by the Karaoke bar
    @guests = []
    @songs = []
  end

end
