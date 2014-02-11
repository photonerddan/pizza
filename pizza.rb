class Pizza

  attr_reader :toppings, :delivery_time

  def initialize(toppings = nil)
    if toppings.nil?
      @toppings = [Topping.new('cheese', vegetarian: false)]
    else
       @toppings = toppings
    end
  end

  def vegetarian?
    @toppings.all? {|topping| topping.vegetarian}
  end

  def add_topping(*toppings)
    toppings.each{|x| @toppings << x}
  end

  def deliver!(time = Time.now)
    @delivery_time = time + 30*60
  end

  def late?(time = Time.now)
    @delivery_time < time
  end
end

class Topping

  attr_reader :name, :vegetarian

  def initialize(topping, vegetarian: false)
    @name = topping
    @vegetarian = vegetarian
  end
end
