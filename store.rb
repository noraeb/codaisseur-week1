@cart = ""
@totalprice = 0
@inventory = [
  { :product => "White chocolate bars", :quantity => 500, :price => 2.5},
  { :product => "Dark chocolate bars", :quantity => 500, :price => 3},
  { :product => "Sea salt caramel chocolate bars", :quantity => 1000, :price => 3.5}
  ]
@totalcart = 0.0


def added_price(price, amount)
  @totalprice += (price * amount)
end

def show_inventory
puts "
Here's our inventory:

#{@inventory}"
end

def show_contents_of_the_cart
  puts "Your cart holds:

  #{@cart}"
end

def add_to_cart(product, amount)
  purchase = " • #{amount} #{product}\n"
  @cart << purchase

  cost_per_item =@inventory[product] ["price"]
  @totalcart += (cost_per_item * amount)

  @inventory[product]["quantity"] -= amount
end

def buy
puts "
What would you like to buy?

1) White chocolate bar?
2) Dark chocolate bar?
3) Sea salt-caramel chocolate bar?

Please make your choice [1-3]
"

product = gets.chomp.to_i

if product == 1
   puts "You chose the white chocolate bar. "
   product= "white chocolate bars"
   price = 2.5
   @cart << "white chocolate bars"
elsif product == 2
    puts "You chose the dark chocolate bar."
    product= "dark chocolate bars"
    price = 3
    @cart << "chocolate bars"
elsif product == 3
    puts "You chose sea salt-caramel chocolate bar (excellent choice, that's my personal favourite)."
    product = "sea salt caramel chocolate bars"
    price = 3
    @cart << "sea salt caramel chocolate bars"
else
    puts "Unfortunatly, that's not an option. Please choose 1, 2 or 3"
    buy
end

puts "How many #{product} would you like to order? Make your choice."

amount = gets.chomp.to_i

puts "You cart holds:

#{amount} #{@cart}"

puts "The total price of your current order is €#{added_price(price, amount)}."
end

def paying
puts "The total price of your order is € #{@totalprice}. How would you like to pay? The options are:
1) iDeal
2) Paypal
3) Creditcard"

option = gets.chomp.to_i

if option == 1
  puts "We will redirect you to iDeal"
elsif option == 2
  puts "We will redirect you to Paypal"
elsif option == 3
  puts "We will redirect you to your creditcard company's website"
end

puts "Thanks for shopping at Nora's Delicious Chocolate Company. Enjoy the chocolate and hopefully we'll see you soon!"
end

def continue
puts "Would you like to order anything else? Please make your choice:
1) Yes
2) No"

customer_continue = gets.chomp.to_i

if customer_continue == 1
  show_inventory
  buy
  continue
elsif customer_continue == 2
  paying
else
  puts "That's not a correct response. Please type 1 for yes or 2 for no"
end
end

def welcome
puts "Welcome to Nora's Delicious Chocolate Company!"
show_inventory
buy
continue
end

welcome
