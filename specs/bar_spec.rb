require('minitest/autorun')
require('minitest/rg')

require_relative('../bar.rb')
require_relative('../guest.rb')

class TestBar < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jeff", 3, "Ave Maria")
    @guest2 = Guest.new("Theresa", 12, "Sharp Dressed Man")
    @drinks = [
      {
        name: "whisky",
        price: 4,
        quantity: 20
      },
      {
        name: "vodka",
        price: 3,
        quantity: 25
      },
      {
        name: "wine",
        price: 2,
        quantity: 30
      }
    ]
    @tabs = []
    @bar = Bar.new("Red", @drinks, @tabs)
  end

  def test_bar_has_name
    assert_equal("Red", @bar.name)
  end

  def test_bar_has_drinks
    assert_equal(3, @bar.drinks.count)
  end

  def test_bar_has_tabs
    assert_equal(0, @bar.tabs.count)
  end

  def test_check_purchase__true
    assert_equal(true, @bar.check_purchase(@drinks[0], @guest2))
  end

  def test_check_purchase__false
    assert_equal(false, @bar.check_purchase(@drinks[0], @guest1))
  end

  def test_update_tab
    assert_equal([{name: "Jeff", tab: 2}], @bar.update_tab(2, @guest1))
  end

  def test_update_stock
    @bar.update_stock(@drinks[0])
    assert_equal(19, @bar.drinks[0][:quantity])
  end

  def test_sell_drink__customer_can_afford
    @bar.sell_drink(@drinks[2], @guest1)
    assert_equal(1, @guest1.money)
    assert_equal({name: "Jeff", tab: 2}, @bar.tabs[0])
    assert_equal(29, @bar.drinks[2][:quantity])
  end

  def test_sell_drink__customer_cannot_afford
    @bar.sell_drink(@drinks[0], @guest1)
    assert_equal(3, @guest1.money)
    assert_equal(0, @bar.tabs.count)
    assert_equal(20, @bar.drinks[0][:quantity])
  end

end
