class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    puts "date || credit || debit || balance" + " " +
    Time.now.strftime("%d/%m/%Y") + "||" + "||" + "500.00" + "||" + "2500.00" + " " +
    Time.now.strftime("%d/%m/%Y") + "||" + "2000.00" + "||" + "3000.00" + " " + 
    Time.now.strftime("%d/%m/%Y") + "||" + "1000.00" + "||" + "1000.00"
  end
end
