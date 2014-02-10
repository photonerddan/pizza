class Pizza

    attr_reader :toppings

    def initialize(toppings)
      @toppings = toppings
  end
end

class Topping

  attr_reader :name, :vegetarian

  def initialize(topping, vegetarian: false)
    @name = topping
    @vegetarian = vegetarian
  end
end
