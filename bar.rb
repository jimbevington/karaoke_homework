class Bar

  attr_reader :name, :drinks, :tabs

  def initialize(name, drinks, tabs)
    @name = name
    @drinks = drinks
    @tabs = tabs
    # tabs currently an [] of {}, with guest name and tab
    # might be better with guest object rather than name
  end

  def check_purchase(drink, guest)
    drink[:price] <= guest.money
  end

  def update_tab(price, guest)
    @tabs.push({name: guest.name, tab: price})
  end

  def update_stock(drink)
    for d in @drinks
      if d == drink
        d[:quantity] -= 1
      end
    end
  end

  def sell_drink(drink, guest)
    if check_purchase(drink, guest)
      guest.spend_money(drink[:price]) # deduct customer cash
      update_tab(drink[:price], guest)
      update_stock(drink)
    else
      return "You can't afford it mate!"
    end
  end

end
