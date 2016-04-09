@inventory = {}
@cart = ""
@total_cart_value = 0.0

def build_inventory
  add_to_inventory("cats", 4, 80.0)
  add_to_inventory("dogs", 2, 280.0)
  add_to_inventory("hamsters", 1, 2.50)
  add_to_inventory("lizzards", 0, 14.0)
end

def add_to_inventory(product, quantity, price)
  @inventory[product] = {
    "quantity" => quantity,
    "price" => price
  }
end

def show_inventory
  puts "The inventory holds:

  #{@inventory}
  "
end

def in_stock?(product, quantity = 1)
  @inventory[product] && @inventory[product]["quantity"] >= quantity
end

def show_contents_of_the_cart
  puts "Your cart holds:

  #{@cart}

  Total cart value: €#{@total_cart_value}"
end

def add_to_cart(product, amount)
  purchase = "  • #{amount} #{product}\n"
  @cart << purchase

  cost_per_item = @inventory[product]["price"]
  @total_cart_value += (cost_per_item * amount)

  @inventory[product]["quantity"] -= amount
end

build_inventory
show_inventory

puts "What would you like to buy?"
purchase = gets.chomp

if in_stock?(purchase)
  puts "How many #{purchase} would you like to buy then?"
  amount = gets.chomp.to_i

  if in_stock?(purchase, amount)
    add_to_cart(purchase, amount)

    show_contents_of_the_cart
  end
else
  puts "We're fresh out of #{purchase}, sorry!"
end

show_inventory
