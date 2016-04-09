class Cart
  def initialize
    @cart = []
  end

  def put_in_cart(product)
    @cart << product
  end

  def content
    puts "Your shopping cart holds:
    #{@cart}"
  end

end
