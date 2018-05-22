module Printer
  STATEMENT_HEADER = "date || credit || debit || balance".freeze

  def print_balance(account = @selected_account)
    puts account.balance.to_s
  end

  # assumes statement is in array format
  def print_statement(header = STATEMENT_HEADER, statement = @statement.records)
    puts header
    puts print_friendly(statement)
  end

  private

  def print_friendly(data)
    data.map { |x| x.values.join(" || ") }
  end
end
