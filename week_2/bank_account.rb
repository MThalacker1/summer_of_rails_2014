class BankAccount
  attr_reader :balance
  attr_accessor :name, :records, :msg

  def deposit(amount)
    @balance += amount
    @msg = "Deposit of #{sprintf("$%.2f", amount)}\n"
    @records.push("#{self.msg}")
  end

  def withdraw(amount)
    @balance -= amount
    @msg = "Withdrawal of #{sprintf("$%.2f", amount)}\n"
    @records.push("#{self.msg}")
  end

  def history
    puts "History for account '#{self.name}':"
    records.each do |record|
      puts record
    end
    puts summary
  end

  def initialize
    @balance = 0
    @msg = ""
    @records = []
  end

  def to_s
    self.balance.to_s
    sprintf("$%.2f", self.balance)
  end

  def summary
    puts "The account '#{self.name}' has a balance of #{self.to_s}."
  end
end

rcu = BankAccount.new
rcu.deposit(400)
rcu.withdraw(75)
rcu.deposit(20)
rcu.withdraw(60)
puts "What would you like to name your account?"
rcu.name = gets.chop 
rcu.history

