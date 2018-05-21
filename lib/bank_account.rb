class BankAccount
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    @balance -= amount
  end

end
