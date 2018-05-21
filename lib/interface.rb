class CustomerInterface

  def initialize(bank_account = new BankAccount, transactions = new Transactions, statement = new Statement)
    @bank_account = bank_account
    @transactions = transactions
    @statement = statement
  end

  def deposit(amount)
    @transactions.add(amount,@bank_account.balance)
    save(amount,nil,@bank_account.balance)
  end

  def withdraw(amount)
    @transactions.subtract(amount,@bank_account.balance)
    save(nil,amount,@bank_account.balance)
  end

  def print_balance
    puts @bank_account.balance
  end

  def print_statement
    puts "date || credit || debit || balance"
    puts print_friendly(@statement.records)
  end

  private

  def save(credit, debit, balance)
    @statement.save_transaction(credit, debit, balance)
  end

  def print_friendly(data)
      data.map{|x| x.values.join(" || ")}
  end

end
