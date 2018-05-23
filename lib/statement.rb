class Statement
  attr_accessor :statement

  HEADER = %w[date credit debit balance].freeze
  DELIMITER = ' || '.freeze

  def initialize(transactions)
    @statement = statement_formatting(transactions)
  end

  private

  def statement_formatting(transactions)
    transactions.map { |x| x.values.join(DELIMITER) }.unshift(HEADER.join(DELIMITER))
  end
end
