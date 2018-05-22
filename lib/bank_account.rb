class BankAccount
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    balance_error(amount)
    @balance -= amount
  end

  def balance_error(amount)
    raise 'Insufficient Balance!' if (@balance - amount) < -100
  end
end
