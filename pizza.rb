class Pizza
end

class Topping
  attr_reader :name, :vegetarian

  def initialize(topping, vegetarian: false)
    @name = topping
    @vegetarian = vegetarian
  end
end
