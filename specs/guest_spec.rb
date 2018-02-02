require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Father Christmas")
  end

  def test_guest_has_name
    assert_equal("Father Christmas", @guest.name)
  end

end
