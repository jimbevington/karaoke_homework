require('minitest/autorun')
require('minitest/rg')

require_relative('../karaoke_bar.rb')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../room.rb')


class TestKaraokeBar < MiniTest::Test

  def setup
    @karaoke_bar = KaraokeBar.new("Posers")

  end

  def test_bar_has_name
    assert_equal("Posers", @karaoke_bar.name)
  end

  def test_bar_has_songs
    assert_equal([], @karaoke_bar.songs)
  end

  def test_bar_has_rooms
    assert_equal([], @karaoke_bar.rooms)
  end

  def test_bar_has_guests
    assert_equal([], @karaoke_bar.guests)
  end

  def test_can_create_song
    @karaoke_bar.create_song("Barbie Girl", "Aqua")
    assert_equal(1, @karaoke_bar.songs.count)
  end

  def test_can_create_room
    @karaoke_bar.create_room("Dirty Bronze")
    assert_equal(1, @karaoke_bar.rooms.count)
  end

end
