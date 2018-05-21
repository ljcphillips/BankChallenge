class Transaction
  attr_accessor :balance
  attr_accessor :list
  def initialize
    @list = []
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    save(amount, nil, @balance)
  end

  def withdraw(amount )
    @balance -= amount
    save(nil, amount, @balance)
  end

  def save(credit = nil, debit = nil, balance)
    @list << {"date" => Time.now.strftime("%d/%m/%Y"), "credit" => credit, "debit" => debit, "balance" => balance}
  end

end
