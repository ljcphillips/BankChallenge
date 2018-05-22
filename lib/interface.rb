require 'bank_account.rb'
require 'statement.rb'

class Interface
  attr_accessor :bank_account, :statement

  def initialize(bank_account = BankAccount.new, statement = Statement.new)
    @bank_account = bank_account
    @statement = statement
  end

  def deposit(amount)
    @bank_account.add(amount)
    save(:credit=>amount, :balance=>@bank_account.balance)
  end

  def withdraw(amount)
    @bank_account.subtract(amount)
    save(:debit=>amount, :balance=>@bank_account.balance)
  end

  def print_balance
    puts @bank_account.balance.to_s
  end

  def print_statement
    puts "date || credit || debit || balance"
    puts print_friendly(@statement.records)
  end

  private

  def save(args)
    @statement.save_transaction(args)
  end

  def print_friendly(data)
      data.map { |x| x.values.join(" || ") }
  end
end
