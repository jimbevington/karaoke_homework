require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @song = Song.new("Maggot Brain", "Funkadelic")
    @guest = Guest.new("Father Christmas", 50, "Maggot Brain")
    @songs = [@song]
  end

  def test_guest_has_name
    assert_equal("Father Christmas", @guest.name)
  end

  def test_guest_has_money
    assert_equal(50, @guest.money)
  end

  def test_guest_spend_money
    @guest.spend_money(25)
    assert_equal(25, @guest.money)
  end

  def test_guest_has_fave_song
    assert_equal("Maggot Brain", @guest.fave_song)
  end

  def test_check_songs
    result = @guest.check_songs(@songs)
    assert_equal("Whoo! They have my song!", result)
  end

end
