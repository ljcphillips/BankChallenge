require 'bank_account.rb'
describe BankAccount do
    subject(:bank_account) { described_class.new}

      it "returns 0" do
        expect(subject.balance).to eql(0)
      end

end      
