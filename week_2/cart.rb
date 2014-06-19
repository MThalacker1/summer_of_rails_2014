class Item
  attr_accessor :name, :price
  def initialize(name = "", price = 0)
    @name = name
    @price = price
  end
  def give_name(choice)
    @name = choice
  end
  def give_price(choice)
    @price = choice
  end
end

class Cart
  attr_reader :in_cart, :bagged, :msg, :total, :qty

  def initialize
    @total = 0
    @msg = ""
    @in_cart = []
    @bagged = {}
    @qty = 0
  end

  def add_item(selection)
    in_cart.push(selection)
    if @bagged.include? selection
     @bagged[selection] += 1
    else
     @bagged[selection] = 1
    end
  end

  def items
    @msg += "Total items:\n"
    @bagged.each { |item, qty|
      @msg += "#{item.name}: #{sprintf("$%.2f", item.price)} x #{qty} = #{sprintf("$%.2f", item.price * qty)}\n"
    } 
    msg
  end

  def total
    @bagged.each { |item, qty|
    @total += item.price * qty  
    }
    total = "Total: #{sprintf("$%.2f", @total)}"
    total
  end
end

  grocery_cart =  Cart.new
  cd = Item.new("Madonna cd", 2)
  book = Item.new("Roots book", 60)
  pen = Item.new("Bic pen", 1)
  fish = Item.new("Romeo the fish", 40)
  pizza = Item.new("Jacks pizza", 5)
  options = {"1" => cd, "2" => book, "3" => pen, "4" => fish, "5" => pizza}
  
  options.invert.each do |number, item|
    puts "To add #{number.name} for #{sprintf("$%.2f", number.price)} enter number: #{item}"
  end

  
  loop = true
  while loop
    puts %Q{Would you like to add an item?}
    keep_going = gets.chop
    if keep_going == "yes"
      puts "Add items?"
      item = gets.chop
      grocery_cart.add_item(options[item])
    else
      loop = false
    end
  end

  
  puts grocery_cart.items  
  puts grocery_cart.total
