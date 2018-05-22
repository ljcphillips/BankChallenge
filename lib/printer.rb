module Printer
  STATEMENT_HEADER = "date || credit || debit || balance"

  def print_figure(figure)
    puts figure.to_s
  end

  def print_array(array)
    puts STATEMENT_HEADER
    puts print_friendly(array)
  end

  private

  def print_friendly(data)
    data.map { |x| x.values.join(" || ") }
  end
end
