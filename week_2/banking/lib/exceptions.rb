class OverTheLimitError < Exception
  def to_s
    "You are attempting to withdraw an amount in excess of your current balance."
  end
end

class WrongDataTypeForDepositError < Exception
  def to_s
    "The deposit amount must be a number."
  end
end

class WrongDataTypeForWithdrawalError < Exception
  def to_s 
    "The withdrawal amount must be a number"
  end
end
