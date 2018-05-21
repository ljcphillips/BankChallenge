require 'interface.rb'
describe Interface do
subject(:interface) { described_class.new }

  it 'increase the balance by 100 when 100 is deposited' do
    subject.deposit(100)
    expect(subject.bank_account.balance). to eql(100)
  end

  it 'decreases the balance by 100 when 100 is withdrawn' do
    subject.withdraw(100)
    expect(subject.bank_account.balance). to eql(-100)
  end


  it 'prints the current balance' do
    expect do
      subject.print_balance
    end. to output("0\n").to_stdout
  end

  it 'prints the current statement' do
    expect do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      subject.print_statement
    end. to output("date || credit || debit || balance\n" + Time.now.strftime("%d/%m/%Y")+ " || 1000 ||  || 1000\n"+ Time.now.strftime("%d/%m/%Y")+ " || 2000 ||  || 3000\n" + Time.now.strftime("%d/%m/%Y")+ " ||  || 500 || 2500\n").to_stdout
  end

end
