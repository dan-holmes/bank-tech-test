require "transaction"

describe Transaction do
  context "transaction value positive" do
    let(:transaction) { Transaction.new(value: 10, updated_balance: 50) }
    describe ".debit_formatted" do
      it "returns a formatted, positive amount" do
        expect(transaction.debit_formatted).to eq "10.00"
      end
    end
    describe ".credit_formatted" do
      it "returns nil" do
        expect(transaction.credit_formatted).to be_nil
      end
    end
  end

  context "transaction value negative" do
    let(:transaction) { Transaction.new(value: -10, updated_balance: 50) }
    describe ".debit_formatted" do
      it "returns nil" do
        expect(transaction.debit_formatted).to be_nil
      end
    end
    describe ".credit_formatted" do
      it "returns a formatted, positive amount" do
        expect(transaction.credit_formatted).to eq "10.00"
      end
    end
  end

  describe ".updated_balance_formatted" do
    let(:transaction) { Transaction.new(value: 10, updated_balance: 50) }
    it "returns the given updated_balance formatted as a string" do
      expect(transaction.updated_balance_formatted).to eq "50.00"
    end
  end

  describe ".date" do
    it "can be set manually for each transaction" do
      transaction = Transaction.new(value: 10, updated_balance: 50, date: Date.new(2020, 1, 1))
      expect(transaction.date).to eq Date.new(2020, 1, 1)
    end

    it "defaults to today's date" do
      transaction = Transaction.new(value: 10, updated_balance: 50)
      expect(transaction.date).to eq Date.today
    end
  end
end
