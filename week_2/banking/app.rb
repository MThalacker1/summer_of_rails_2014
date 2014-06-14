require_relative 'lib/interest'
require_relative 'lib/logger'
require_relative 'lib/exceptions'
require_relative 'lib/bank_account'

account = BankAccount.new(100, "User47")
loop = true
while loop do
  puts "Please enter: '1' = make a deposit, '2' = withdrawal, or 'q' to quit and display summary"
  type = gets.chop
  if type == ('1') || type == ('2')
    if type == ('1')
      type = "deposit"
    else
      type = "withdrawal"
    end
    type == ("deposit") ? (puts "How much would you like to deposit?") : (puts "How much would you like to withdraw?")
    amount = gets.chop.to_i
    type == ("deposit") ? account.deposit(amount) : account.withdraw(amount)
    puts account.history
  else
    puts account.history
    loop = false
  end
end

