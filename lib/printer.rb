module Printer
  def print_balance(account = @selected_account.balance)
    puts account.to_s
  end

  # assumes statement is in array format
  def print_statement(header = Statement::STATEMENT_HEADER, statement = @statement.records)
    puts header
    puts print_friendly(statement)
  end

  private

  def print_friendly(data)
    data.map { |x| x.values.join(" || ") }
  end
end
