require 'statement.rb'
describe Statement do
  subject(:statement) { described_class.new }

  it 'initializes with an empty records array' do
    expect(subject.records).to eql([])
  end

  it 'stores new transactions in the records array with todays date' do
    subject.save_transaction(credit: 1000, balance: 1000)
    expect(subject.records).to eql([{"date" => Time.now.strftime("%d/%m/%Y"), "credit" => 1000, "debit" => nil, "balance" => 1000}])
  end
end
