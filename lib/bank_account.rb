class BankAccount
  attr_accessor :balance, :overdraft

  DEFAULT_BALANCE = 0
  DEFAULT_OVERDRAFT = 100

  def initialize
    @balance = DEFAULT_BALANCE
    @overdraft = DEFAULT_OVERDRAFT
  end

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    balance_error(amount)
    @balance -= amount
  end

  def balance_error(amount)
    raise 'Insufficient Balance!' if amount > (@balance + @overdraft)
  end
end
