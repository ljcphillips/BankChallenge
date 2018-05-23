require_relative './printer.rb'
require_relative './statement.rb'

class BankAccount
  include Printer
  attr_accessor :balance, :overdraft, :transactions

  DEFAULT_BALANCE = 0
  DEFAULT_OVERDRAFT = 100

  def initialize
    @balance = DEFAULT_BALANCE
    @overdraft = DEFAULT_OVERDRAFT
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    save(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    balance_error(amount)
    @balance -= amount
    save(debit: amount, balance: @balance)
  end

  private

  def save(args)
    @transactions << { "date" => Time.now.strftime("%d/%m/%Y"),
                       "credit" => args[:credit],
                       "debit" => args[:debit],
                       "balance" => args[:balance] }
  end

  def balance_error(amount)
    raise 'Insufficient Balance!' if amount > (@balance + @overdraft)
  end
end
