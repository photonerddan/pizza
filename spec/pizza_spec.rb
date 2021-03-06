require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  it "has a method for determining if pizza is vegetarian" do
    pizza1 = Pizza.new([Topping.new('cheese', vegetarian: true), Topping.new('olives', vegetarian: true), Topping.new('onion', vegetarian: true)])
    pizza2 = Pizza.new([Topping.new('cheese', vegetarian: true), Topping.new('bacon', vegetarian: false), Topping.new('onion', vegetarian: true)])
    expect(pizza1.vegetarian?).to eq(true)
    expect(pizza2.vegetarian?).to eq(false)
  end

  it "has a method for adding toppings" do
    pizza = Pizza.new()

    expect(pizza.toppings.count).to eq(1)

    pizza.add_topping(Topping.new('bacon', vegetarian: false))

    expect(pizza.toppings.count).to eq(2)

    pizza.add_topping(Topping.new('bacon', vegetarian: false),Topping.new('bacon', vegetarian: false),Topping.new('bacon', vegetarian: false))

    expect(pizza.toppings.count).to eq(5)
  end

  it "can be delivered" do
    pizza = Pizza.new
    time = Time.now
    pizza.deliver!(time)
    expect(pizza.delivery_time).to eq(time + 30*60)
  end

  it "can be late" do
    pizza = Pizza.new
    pizza.deliver!
    time = Time.now + 31 * 60
    expect(pizza.late?(time)).to eq(true)
  end

  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
      Topping.new('mushrooms', vegetarian: true),
      Topping.new('peperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults pizza to cheese if no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings[0].name).to eq('cheese')
    end
  end
end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do

    it "sets the name of the topping" do
      topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it "sets whether or not the topping is vegetarian" do
      topping = Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end
  end
end
