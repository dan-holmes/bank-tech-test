require "account"

describe Account do
  let(:account) { Account.new }
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }

  describe ".deposit" do
    it "increases the balance by the given amount" do
      expect { account.deposit(10) }.to change { account.balance }.by(10)
    end
    it "create a new transaction with given value, updated balance and today's date" do
      expect(transaction_class).to receive(:new).with(value: 10, updated_balance: 10, date: Date.today)
      account.deposit(10, transaction_class: transaction_class)
    end
    it "adds new transaction to list" do
      expect { account.deposit(10) }.to change { account.transactions.length }.by(1)
    end
    it "optionally adds a date to the transaction" do
      date = Date.new(2020, 1, 1)
      expect(transaction_class).to receive(:new).with(value: 10, updated_balance: 10, date: date)
      account.deposit(10, transaction_class: transaction_class, date: date)
    end
    it "will reject a deposit of 0" do
      expect { account.deposit(0) }.to raise_error "You must enter a non-zero amount."
    end
    it "will error if transaction would lead to a negative balance" do
      expect { account.deposit(-60) }.to raise_error "Insufficient funds for transaction."
    end
    it "will error if value given is not a number" do
      expect { account.deposit("nan") }.to raise_error "Value must be a number."
    end
    it "will error if given fractions of a penny" do
      expect { account.deposit(1.001) }.to raise_error "You can't deposit or withdraw a fraction of a penny."
    end
  end

  describe ".withdraw" do
    before do
      account.deposit(50)
    end
    it "decreases the balance by the given amount" do
      expect { account.withdraw(10) }.to change { account.balance }.by(-10)
    end
    it "create a new transaction with given value, updated balance and today's date" do
      expect(transaction_class).to receive(:new).with(value: -10, updated_balance: 40, date: Date.today)
      account.withdraw(10, transaction_class: transaction_class)
    end
    it "adds new transaction to list" do
      expect { account.withdraw(10) }.to change { account.transactions.length }.by(1)
    end
    it "optionally adds a date to the transaction" do
      date = Date.new(2020, 1, 1)
      expect(transaction_class).to receive(:new).with(value: -10, updated_balance: 40, date: date)
      account.withdraw(10, transaction_class: transaction_class, date: date)
    end
    it "will reject a withdrawal of 0" do
      expect { account.withdraw(0) }.to raise_error "You must enter a non-zero amount."
    end
    it "will error if transaction would lead to a negative balance" do
      expect { account.withdraw(60) }.to raise_error "Insufficient funds for transaction."
    end
    it "will error if value given is not a number" do
      expect { account.withdraw("nan") }.to raise_error "Value must be a number."
    end
    it "will error if given fractions of a penny" do
      expect { account.withdraw(1.001) }.to raise_error "You can't deposit or withdraw a fraction of a penny."
    end
  end
end
