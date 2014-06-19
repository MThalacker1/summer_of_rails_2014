require_relative 'lib/shopping_cart'
require_relative 'lib/exceptions'

grocery_cart =  ShoppingCart::Cart.new
  cd = ShoppingCart::Item.new("Madonna cd", 2)
  book = ShoppingCart::Item.new("Roots book", 60)
  pen = ShoppingCart::Item.new("Bic pen", 1)
  fish = ShoppingCart::Item.new("Romeo the fish", 40)
  pizza = ShoppingCart::Item.new("Jacks pizza", 5)
  options = {"1" => cd, "2" => book, "3" => pen, "4" => fish, "5" => pizza}

  options.invert.each do |number, item|
    puts "To add #{number.name} for #{sprintf("$%.2f", number.price)} enter number: #{item}"
  end

  
  loop = true
  while loop
    puts %Q{Would you like to add an item?}
    keep_going = gets.chop
    if keep_going == "yes"
      puts "Which item (1-5) would you like to add?"
      item = gets.chop
      grocery_cart.add_item(options[item])
      grocery_cart.alert
    else
      loop = false
    end
  end

  
  puts grocery_cart.items  
  puts grocery_cart.total
