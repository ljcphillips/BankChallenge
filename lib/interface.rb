require 'bank_account.rb'
require 'statement.rb'

class Interface

  attr_accessor :bank_account
  attr_accessor :statement

  def initialize(bank_account = BankAccount.new, statement = Statement.new)
    @bank_account = bank_account
    @statement = statement
  end

  def deposit(amount)
    @bank_account.add(amount)
    save(amount,nil,@bank_account.balance)
  end

  def withdraw(amount)
    @bank_account.subtract(amount)
    save(nil,amount,@bank_account.balance)
  end

  def print_balance
    puts @bank_account.balance.to_s
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
