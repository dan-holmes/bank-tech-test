require "transaction"

describe Transaction do
  describe ".initialize" do
    it "is initialized with a value" do
      transaction = Transaction.new(10)
      expect(transaction.value).to eq 10
    end
  end

  describe ".type" do
    it "returns :debit if value is positive" do
      transaction = Transaction.new(10)
      expect(transaction.type).to eq :debit
    end

    it "returns :credit if value is negative" do
      transaction = Transaction.new(-10)
      expect(transaction.type).to eq :credit
    end
  end
end
