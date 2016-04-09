@cart = ""
@total_cart_value = 0.0
@inventory = [
  { :nr => 1, :product => "White chocolate bar", :quantity => 500, :price => 2.5},
  { :nr => 2, :product => "Dark chocolate bar", :quantity => 700, :price => 3},
  { :nr => 3, :product => "Sea salt caramel chocolate bar", :quantity => 1000, :price => 3.5}
]
@categories = 

def show_inventory
@inventory.each do |product|
  puts "#{product[:nr]}. #{product[:product]}"
  puts "In stock: #{product[:quantity]}"
  puts "Price: €#{product[:price]}"
  puts "*" * 40
  end
end

def show_contents_of_the_cart
  puts "Your cart holds:

   • #{@cart}

  Total cart value: €#{@total_cart_value}"
end

def add_to_cart(product, amount)
  purchase = "  • #{amount} #{product}\n"
  @cart << purchase

  cost_per_item = @inventory[product]["price"]
  @total_cart_value += (cost_per_item * amount)

  @inventory[product]["quantity"] -= amount
end

def buy

puts "
What would you like to buy?

#{show_inventory}

Please make your choice [1-3]
"

purchase = gets.chomp.to_i

puts "How many would you like to buy?"

amount = gets.chomp.to_i

if product == 1
    puts "You chose #{amount} #{@inventory[0[:product]]}. "
    #@cart << amount @inventory[0[:product]]
elsif product == 2
    puts "You chose #{amount} #{@inventory[1[:product]]}"
    #@cart << amount @inventory[1[:product]]
elsif product == 3
    puts "You chose #{amount} #{@inventory[2[:product]]}."
    #@cart << amount @inventory{2[:product]}
else
    puts "Unfortunatly, that's not an option. Please choose 1, 2 or 3"
    buy
end
end

buy
