require 'interface.rb'
describe Interface do
  subject(:interface) { described_class.new }

  it 'increase the balance of an account by 100 when 100 is deposited' do
    subject.new_account(reference: 1)
    subject.select_account(1)
    expect { subject.deposit(100) }.to change { subject.selected_account.balance }.by(100)
  end

  it 'decreases the balance by 100 when 100 is withdrawn' do
    subject.new_account(reference: 1)
    subject.select_account(1)
    expect { subject.withdraw(100) }.to change { subject.selected_account.balance }.by(-100)
  end

  it 'prints the current balance' do
    subject.new_account(reference: 1)
    subject.select_account(1)
    expect do
      subject.print_balance
    end. to output("0\n").to_stdout
  end

  it 'prints the current statement' do
    expect do
      subject.new_account(reference: 1)
      subject.select_account(1)
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      subject.print_statement("date || credit || debit || balance")
    end. to output("date || credit || debit || balance\n" +
      Time.now.strftime('%d/%m/%Y') + " || 1000 ||  || 1000\n" +
      Time.now.strftime('%d/%m/%Y') + " || 2000 ||  || 3000\n" +
      Time.now.strftime('%d/%m/%Y') + " ||  || 500 || 2500\n").to_stdout
  end
end
