loop = true

while(loop) do
  puts "Put some stuff here" 
  string = gets.chop
  if string == ""
    loop = false
  end
end
