require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../guest.rb')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Golden Splendour")
    @guest = Guest.new("the baby Jesus")
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



end
