module Interest
  def calculateInterest(balance, rate, time)
    interest = @balance * (rate / 100) * time
    sprintf("$%.2f",interest)
  end
end

class BankAccount
  attr_reader :balance
  attr_accessor :name, :records, :msg
  include Interest

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
    msg = ""
    msg += "History for account '#{self.name}':\n"
    records.each do |record|
      msg += "#{record}"
    end
    msg += "#{summary}"
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
    msg = "The account '#{self.name}' has a balance of #{self.to_s}."
    msg
  end
end

  
rcu = BankAccount.new
rcu.deposit(400)
rcu.withdraw(75)
rcu.deposit(20)
rcu.withdraw(60)
puts "What would you like to name your account?"
rcu.name = gets.chop
puts rcu.history
puts "Rate"
rate = gets.chop.to_f
puts "Time"
time = gets.chop.to_i
puts "The interest is #{rcu.calculateInterest(rcu.balance, rate, time)}"
