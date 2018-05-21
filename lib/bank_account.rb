require_relative 'transaction.rb'
class BankAccount
  attr_accessor :transaction
  attr_accessor :statement

  def initialize(transaction = Transaction.new)
    @transaction = transaction
  end

  def statement
    @statement = @transaction.list.map{|x| x.values.join(" || ")}
  end
  def print_statement
    puts "date || credit || debit || balance"
    puts @statement
  end
end
