class Statement

  attr_accessor :records

  def initialize
    @records = []
  end

  def save_transaction(credit = nil, debit = nil, balance)
    @records << {"date" => Time.now.strftime("%d/%m/%Y"), "credit" => credit, "debit" => debit, "balance" => balance}
  end
end
