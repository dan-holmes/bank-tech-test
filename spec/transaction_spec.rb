require "transaction"

describe Transaction do
  describe ".initialize" do
    it "stores a value and updated_balance balance" do
      transaction = Transaction.new(value: 10, updated_balance: 50)
      expect(transaction.value).to eq 10
      expect(transaction.updated_balance).to eq 50
    end
  end

  describe ".type" do
    it "returns :debit if value is positive" do
      transaction = Transaction.new(value: 10, updated_balance: 50)
      expect(transaction.type).to eq :debit
    end

    it "returns :credit if value is negative" do
      transaction = Transaction.new(value: -10, updated_balance: 50)
      expect(transaction.type).to eq :credit
    end
  end

  describe ".date" do
    it "can be set and retrieved" do
      transaction = Transaction.new(value: 10, updated_balance: 50, date: Date.new(2020, 1, 1))
      expect(transaction.date).to eq Date.new(2020, 1, 1)
    end

    it "defaults to today's date" do
      transaction = Transaction.new(value: 10, updated_balance: 50)
      expect(transaction.date).to eq Date.today
    end
  end
end
