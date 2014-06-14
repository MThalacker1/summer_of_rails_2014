class BankAccount
  attr_reader :balance
  attr_accessor :name, :records, :msg
  include Interest
  include Logger

  def initialize(starting_balance = 0, starting_name = 0)
    @balance = starting_balance
    @name = starting_name
    @msg = ""
    @records = []
  end

  def to_s
    self.balance.to_s
    sprintf("$%.2f", self.balance)
  end

  def deposit(amount)
    raise WrongDataTypeForDepositError unless amount.is_a? Numeric
    @balance += amount

    @msg = "Deposit of #{sprintf("$%.2f", amount)}\n"
    @records.push("#{self.msg}")
  end

  def withdraw(amount)
    raise WrongDataTypeForWithdrawalError unless amount.is_a? Numeric
    raise OverTheLimitError unless (amount < balance)
    @balance -= amount
    @msg = "Withdrawal of #{sprintf("$%.2f", amount.to_i)}\n"
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

  def summary
    msg = "The account '#{self.name}' has a balance of #{self.to_s}."
    msg
  end
end
  
