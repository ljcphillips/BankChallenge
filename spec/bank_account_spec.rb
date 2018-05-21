require 'bank_account.rb'
describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'returns 0 when asked for bank.balance' do
    expect(subject.balance).to eql(0)
  end

  it 'increase the balance by 100 when 100 is deposited'
    subject.deposit(100)
    expect(subject.balance). to eql(100)
end
