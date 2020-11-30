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

  describe ".new_balance" do
    it "returns the initial balance, plus the value of the transaction" do
      transaction = Transaction.new(value: 10, initial_balance: 50)
      expect(transaction.new_balance).to eq 60
    end
  end

  describe ".date" do
    it "can be set using the constructor as a string" do
      transaction = Transaction.new(value: 10, initial_balance: 50, date: "2020-01-01")
      expect(transaction).to be_a Transaction
    end

    it "will be stored in the form of a date" do
      transaction = Transaction.new(value: 10, initial_balance: 50, date: "2020-01-01")
      expect(transaction.date).to eq Date.new(2020, 1, 1)
    end
  end
end
