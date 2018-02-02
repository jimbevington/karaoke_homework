require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Golden Splendour")
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
    @room.add_guest("the baby Jesus")
    assert_equal(1, @room.guests.count)
  end

  def test_can_remove_guests
    @room.add_guest("the baby Jesus")
    @room.remove_guest("the baby Jesus")
    assert_equal(0, @room.guests.count)
  end

end
