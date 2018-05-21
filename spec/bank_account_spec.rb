require 'bank_account.rb'
describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'returns 0 when asked for bank.balance' do
    expect(subject.balance).to eql(0)
  end

  it 'increase the balance by 100 when 100 is deposited' do
    subject.deposit(100)
    expect(subject.balance). to eql(100)
  end

  it 'decreases the balance by 100 when 100 is withdrawn' do
    subject.withdraw(100)
    expect(subject.balance). to eql(-100)
  end

  it 'prints a statement when asked' do
    expect(subject.print_statement). to be "date || credit || debit || balance"
  end

end
