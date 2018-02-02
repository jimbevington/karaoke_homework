require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../karaoke_bar.rb')

class TestKaraokeBar < MiniTest::Test

  def setup
    @guest1 = Guest.new("The Pope")
    @guest2 = Guest.new("Ant McPartlin")
    @guest3 = Guest.new("Frasier Crane")
    @guest4 = Guest.new("the guy from the old Crystal Maze")
    @song1 = Song.new("The Visitors", "Abba")
    @song2 = Song.new("Get Ur Freak On", "Missy Elliott")
    @song3 = Song.new("It's Gonna Rain", "Steve Reich")
    @playlist1 = [@song1, @song2, @song3]
    @playlist2 = [@song2, @song3]
    @room1 = Room.new("Purgatory", 2)
    @karaoke_bar = KaraokeBar.new("Posers", [@song1, @song2, @song3], [@room1, @room2, @room3])
  end

  def test_bar_has_name
    assert_equal("Posers", @karaoke_bar.name)
  end

  def test_bar_has_songs
    assert_equal(3, @karaoke_bar.songs.count)
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

  def test_add_songs_to_room__multiple_songs
    @karaoke_bar.add_songs(@room1, @playlist1)
    assert_equal(3, @room1.songs.count)
  end

  def test_add_songs_to_room__single_songs
    @karaoke_bar.add_songs(@room1, @song1)
    assert_equal(1, @room1.songs.count)
  end

  def test_room_capacity_full
    @karaoke_bar.check_in(@guest1, @room1)
    @karaoke_bar.check_in(@guest2, @room1)
    result = @karaoke_bar.check_in(@guest3, @room1)
    assert_equal("Room Full. GET OUT!!!", result)
  end

end
