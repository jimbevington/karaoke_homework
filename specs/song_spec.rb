require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Never Too Much", "Luther Vandross")
  end

  def test_song_has_name
    assert_equal("Never Too Much", @song.name)
  end

  def test_song_has_artist
    assert_equal("Luther Vandross", @song.artist)
  end

end
