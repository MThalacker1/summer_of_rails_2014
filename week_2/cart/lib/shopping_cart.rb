module ShoppingCart

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
    attr_reader :in_cart, :bagged, :msg, :total, :qty, :alert

    def initialize
      @alert = ""
      @total = 0
      @msg = ""
      @in_cart = []
      @bagged = {}
      @qty = 0
    end

    def add_item(selection)
      raise InvalidSelectionError unless selection.is_a? Item
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
end
