require "./product.rb"
require "./category.rb"
require "./shop.rb"

class Inventory
  def initialize
    @categories = []
    chocolatebar_products = [
      Product.new(1, "White chocolatebar", "Sweet, delicious bar made of the best cacao butter, 200 gr.", 2.5),
      Product.new(2, "Dark chocolatebar", "A mix of Ecuadorian and Ethiopian cacao beans, made with love, 200 gr.", 3),
      Product.new(3, "Sea salt caramel chocolate bar", "This addictive combination of sweet and salt, you can't stop eating it! 250 gr.", 3.5),
      Product.new(4, "Customized chocolate bar", "Choose your favourite ingredients and we'll create a special chocolatebar for you, 300 gr.", 5)];
    @categories << Category.new("Chocolatebars",  chocolatebar_products)
    chocolatemilk_products = [
      Product.new(5, "Regular chocolate milk", "Make a nice cup of cacao at home, 1l.", 5),
      Product.new(6, "Dark chocolatemilk", "The best solution for a broken heart, 1l.", 5.5),
      ];
    @categories << Category.new("Chocolatemilk",  chocolatemilk_products)
    chocolatesprinkels_products= [
      Product.new(7, "White chocolate sprinkels", "Your bread will turn into a cake!, 150 gr.", 4),
      Product.new(8, "Dark chocolate sprinkels", "The Dutch experience with these chocolate sprinkels, 150 gr.", 4)
    ];
    @categories << Category.new("Chocolate sprinkels", chocolatesprinkels_products)
  end
  def get_product product_id
    @categories.each do |category|
      category.products.each do |product|
        if product.id == product_id
          return product
        end
          puts "Unfortunatly, we don't have that products, please choose something from our inventory."
          @shop.shop_for_item
      end
    end

  end

  def list
    @categories.each do |category|
      puts category.name
      category.products.each do |product|
          puts "-- #{product.id} #{product.name}"
      end
    end
  end
end
