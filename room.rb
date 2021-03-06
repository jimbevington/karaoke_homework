class Room

  attr_reader :name, :capacity, :price, :bar, :guests, :songs, :total_spend

  def initialize(name, capacity, price, bar)
    @name = name
    @capacity = capacity
    @price = price
    @bar = bar
    # both GUESTS and SONGS are added by the Karaoke bar
    @guests = []
    @songs = []
    @total_spend = 0
  end

  def add_guest(guest)
    @guests.push(guest)
    increase_total_spend() # add to the total
    guest.check_songs(@songs) # check the song
  end

  def increase_total_spend
    # increase the total spend by the price the guest just spent
    @total_spend += price
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

  def bar_sell_drink(drink, guest)
    # pass bar a guest from guest array, get bar to sell drink
    @bar.sell_drink(drink, guest) 
    @total_spend += drink[:price]
  end

end
