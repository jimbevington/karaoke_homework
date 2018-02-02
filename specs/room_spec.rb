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

end
