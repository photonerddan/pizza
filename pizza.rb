class Pizza
end

class Topping
  attr_reader :name

  def initialize(topping)
    @name = topping
  end
end
