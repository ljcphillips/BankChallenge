require 'pry'
require 'bank_account.rb'
describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'returns 0 when asked for bank.balance' do
    expect(subject.transaction.balance).to eql(0)
  end

  it 'has a statement with transactions' do
    subject.transaction.deposit(1000)
    subject.transaction.deposit(2000)
    subject.transaction.withdraw(500)
    expect(subject.statement). to eql(["21/05/2018 || 1000 ||  || 1000", "21/05/2018 || 2000 ||  || 3000", "21/05/2018 ||  || 500 || 2500"])
    binding.pry
  end

end

describe Transaction do
  subject(:transaction) { described_class.new }
  it 'increase the balance by 100 when 100 is deposited' do
    subject.deposit(100)
    expect(subject.balance). to eql(100)
  end

  it 'decreases the balance by 100 when 100 is withdrawn' do
    subject.withdraw(100)
    expect(subject.balance). to eql(-100)
  end

end
