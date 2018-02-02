require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Father Christmas", 50)
  end

  def test_guest_has_name
    assert_equal("Father Christmas", @guest.name)
  end

  def test_guest_has_money
    assert_equal(50, @guest.money)
  end

end
