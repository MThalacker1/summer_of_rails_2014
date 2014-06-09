number = 0;

def is_even?(number)
  number % 2 == 0
end

puts "Please enter a number to see if it's even"
number = gets.to_i

puts is_even?(number) 
