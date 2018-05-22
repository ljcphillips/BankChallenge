require_relative './bank_account.rb'
require_relative './statement.rb'
require_relative './printer.rb'

class Interface
  include Printer
  attr_accessor :bank_accounts, :statement, :selected_account

  def initialize()
    @bank_accounts = []
    @selected_account = nil
    @statement = nil
  end

  def new_account(args)
    @bank_accounts << { "reference" => args[:reference],
      "bank_account" => args.fetch(:bank_account, BankAccount.new),
      "statement" => args.fetch(:statement, Statement.new)}
  end

  def select_account(reference)
    @selected_account = @bank_accounts.select {|bank_account| bank_account["reference"] == reference }[0]["bank_account"]
    @statement = @bank_accounts.select {|bank_account| bank_account["reference"] == reference }[0]["statement"]
  end

  def deposit(amount)
    @selected_account.add(amount)
    save(:credit=>amount, :balance=>@selected_account.balance)
  end

  def withdraw(amount)
    @selected_account.subtract(amount)
    save(:debit=>amount, :balance=>@selected_account.balance)
  end

  private

  def save(args)
    @statement.save_transaction(args)
  end

end
