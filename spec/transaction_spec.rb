require "transaction"

describe Transaction do
  describe ".initialize" do
    it "stores a value and initial balance" do
      transaction = Transaction.new(value: 10, initial_balance: 50)
      expect(transaction.value).to eq 10
      expect(transaction.initial_balance).to eq 50
    end
  end

  describe ".type" do
    it "returns :debit if value is positive" do
      transaction = Transaction.new(value: 10, initial_balance: 50)
      expect(transaction.type).to eq :debit
    end

    it "returns :credit if value is negative" do
      transaction = Transaction.new(value: -10, initial_balance: 50)
      expect(transaction.type).to eq :credit
    end
  end
end
