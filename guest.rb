class Guest

  attr_reader :name, :money, :fave_song

  def initialize(name, money, fave_song)
    @name = name
    @money = money
    @fave_song = fave_song
  end

  def spend_money(amount)
    @money -= amount
  end

end
