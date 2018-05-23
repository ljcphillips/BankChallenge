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
    expect { subject.deposit(100) }.to change { subject.balance }.by(100)
  end

  it 'can subtract an amount from the balance' do
    expect { subject.withdraw(100) }.to change { subject.balance }.by(-100)
  end

  it 'initializes with an empty transactions array' do
    expect(subject.transactions).to eql([])
  end

  it 'stores transactions with todays date' do
    subject.deposit(1000)
    expect(subject.transactions).to eql([{ "date" => Time.now.strftime("%d/%m/%Y"),
                                           "credit" => 1000,
                                           "debit" => nil,
                                           "balance" => 1000 }])
  end

  it 'prints the current balance' do
    expect do
      subject.print_balance(subject.balance)
    end. to output("0\n").to_stdout
  end

  it 'prints the current statement' do
    expect do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      subject.print_statement(Statement.new(subject.transactions).statement)
    end. to output("date || credit || debit || balance\n" +
      Time.now.strftime('%d/%m/%Y') + " || 1000 ||  || 1000\n" +
      Time.now.strftime('%d/%m/%Y') + " || 2000 ||  || 3000\n" +
      Time.now.strftime('%d/%m/%Y') + " ||  || 500 || 2500\n").to_stdout
  end

  context 'when given an opening balance of 0 and an overdraft limit of 100' do
    it 'raises an error if balance will drop below -100' do
      expect { subject.withdraw(101) }.to raise_error('Insufficient Balance!')
    end

    it 'does not raise an error if balance is -100' do
      expect { subject.withdraw(100) }.to change { subject.balance }.by(-100)
    end
  end
end
