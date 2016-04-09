require "./inventory.rb"
require "./cart.rb"

class Shop
  def initialize
    @inventory = Inventory.new
    @cart = Cart.new
  end

  def what_is_in_store
    puts "In store today:"
    @inventory.list
  end

  def checkout
    @cart.content
    puts "The total price"
  end

  def continue_shopping
    puts "Would you like to continue shopping or would you like to check out? [1-2]
    1 Continue shopping
    2 Check out"
    response = gets.chomp.to_i

    if response == 1
      shop_for_item
    elsif response == 2
      checkout
    end
  end

  def shop_for_item

    puts "Select item to buy by product number."
    productnumber = gets.chomp.to_i

    result = @inventory.get_product productnumber

    p result
    @cart.put_in_cart(result)
    @cart.content
  end
end
