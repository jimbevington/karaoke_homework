require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Father Christmas", 50, "Maggot Brain")
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
  
end
