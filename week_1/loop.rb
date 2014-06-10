loop = true

 while(loop) do
  puts "Put some stuff here" 
  string = gets.chop
  if string == ""
   loop = false
  end
  if string.to_i.to_s == string
    if string.to_i % 2 == 0
      type = "an even number"
    else
      type = "an odd number"
    end
  else
    type = "a string"
  end
   puts "You entered #{string} which is #{type}"  
 end

