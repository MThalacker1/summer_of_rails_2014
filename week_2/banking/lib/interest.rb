module Interest
  def calculateInterest(balance, rate, time)
    interest = @balance * (rate / 100) * time #in years calculated annually
    sprintf("$%.2f",interest)
  end
end
