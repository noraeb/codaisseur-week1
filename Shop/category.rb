require "./product.rb"
class Category
  def initialize(name, products)
    @name = name
    @products = products
  end
  def name
    @name
  end
  def products
    @products 
  end
end
