class Statement
  attr_accessor :records

  # STATEMENT_HEADER = "date || credit || debit || balance".freeze

  def initialize
    @records = []
  end

  def save_transaction(args)
    @records << { "date" => Time.now.strftime("%d/%m/%Y"), "credit" => args[:credit], "debit" => args[:debit], "balance" => args[:balance] }
  end
end
