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
    expect(subject.print_statement). to eql "date || credit || debit || balance"
  end

  it 'prints a statement with transactions' do
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)
    expect(subject.print_statement). to eql "date || credit || debit || balance
    21/05/2018 || || 500.00 || 2500.00
    21/05/2018 || 2000.00 || || 3000.00
    21/05/2018 || 1000.00 || || 1000.00"
  end

end
