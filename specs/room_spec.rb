require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../karaoke_bar.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup
    @song = Song.new("Smack My B***h Up!", "The Prodigy")
    @room = Room.new("Golden Splendour", 5, 15)
    @guest = Guest.new("the baby Jesus", 10, @song)
    @karaoke_bar = KaraokeBar.new("Mars", [@song], [@room])
  end

  def test_room_has_name
    assert_equal("Golden Splendour", @room.name)
  end

  def test_room_has_songs
    assert_equal([], @room.songs)
  end

  def test_room_has_guests
    assert_equal([], @room.guests)
  end

  def test_can_add_guests
    @room.add_guest(@guest)
    assert_equal(1, @room.guests.count)
  end

  def test_can_remove_guests
    @room.add_guest(@guest)
    @room.remove_guest(@guest)
    assert_equal(0, @room.guests.count)
  end

  def test_can_add_songs
    @room.add_song(@song)
    assert_equal(1, @room.songs.count)
  end

  def test_can_remove_songs
    @room.add_song(@song)
    @room.remove_song(@song)
    assert_equal(0, @room.songs.count)
  end

  def test_has_capacity
    assert_equal(5, @room.capacity)
  end

  def test_has_price
    assert_equal(15, @room.price)
  end

  def test_guest_check_song_when_added
    @karaoke_bar.add_songs(@room, @song)
    assert_equal("Whoo! They have my song!", @room.add_guest(@guest))


  end

end
