require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../karaoke_bar.rb')

class TestKaraokeBar < MiniTest::Test

  def setup
    @guest1 = Guest.new("The Pope")
    @guest2 = Guest.new("Ant McPartlin")
    @song1 = Song.new("The Visitors", "Abba")
    @song2 = Song.new("Get Ur Freak On", "Missy Elliott")
    @room1 = Room.new("Purgatory")
    @room2 = Room.new("Elysium")
    @room3 = Room.new("IKEA")
    @karaoke_bar = KaraokeBar.new("Posers", [@song1, @song2], [@room1, @room2, @room3])
  end

  def test_bar_has_name
    assert_equal("Posers", @karaoke_bar.name)
  end

  def test_bar_has_songs
    assert_equal(2, @karaoke_bar.songs.count)
  end

  def test_bar_has_rooms
    assert_equal(3, @karaoke_bar.rooms.count)
  end

  def test_bar_has_guests__none
    assert_equal([], @karaoke_bar.guests)
  end

  def test_check_in_guest
    @karaoke_bar.check_in(@guest1, @room1)
    assert_equal(1, @room1.guests.count)
  end

  def test_check_out_guest
    @karaoke_bar.check_in(@guest1, @room1)
    @karaoke_bar.check_in(@guest2, @room1)
    @karaoke_bar.check_out(@guest1, @room1)
    assert_equal(1, @room1.guests.count)
  end


end
