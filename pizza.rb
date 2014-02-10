class Pizza

  attr_reader :toppings

  def initialize(toppings = nil)
    if toppings.nil?
      @toppings = Topping.new('cheese', vegetarian: false)
    else
       @toppings = toppings
    end
  end

  def vegetarian?
    @toppings.all? {|topping| topping.vegetarian}
  end
end

class Topping

  attr_reader :name, :vegetarian

  def initialize(topping, vegetarian: false)
    @name = topping
    @vegetarian = vegetarian
  end
end
