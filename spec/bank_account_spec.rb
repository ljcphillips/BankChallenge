require 'bank_account.rb'
describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'has a bank balance' do
    expect(subject.balance).to be
  end

  it 'initializes with a bank balance of 0' do
    expect(subject.balance).to eql(0)
  end

  it 'can add an amount to the balance' do
    subject.add(100)
    expect(balance).to eql(100)
  end

  it 'can subtract an amount from the balance' do
    subject.subtract(100)
    expect(balance).to eql(0)
  end

end
