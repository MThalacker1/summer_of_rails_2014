loop = true
people = []

while(loop)
puts "Would you like to add a person?"
more = gets.chop

  if more == "yes"

  puts "Please enter a first name for the person"
  first_name = gets.chop

  puts "Please enter a last name for the person"
  last_name = gets.chop

  puts "Please enter the age of the person"
  age = gets.chop.to_i

  person = {
  first_name: "#{first_name}",
  last_name: "#{last_name}",
  age: "#{age}"
  }

  people.push(person)
  
  else
    loop = false
  end
end

puts "You added #{People.length} people."
