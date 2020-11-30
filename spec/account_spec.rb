require "account"

describe Account do
  let(:account) { Account.new }
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }

  describe ".initialize" do
    it "sets balance to 0" do
      expect(account.balance).to eq 0
    end
    it "creates an empty list of transactions" do
      expect(account.transactions).to be_empty
    end
  end

  describe ".deposit" do
    it "increases the balance by the given amount" do
      expect { account.deposit(10) }.to change { account.balance }.by(10)
    end
    it "create a new transaction with given value and updated balance" do
      expect(transaction_class).to receive(:new).with(value: 10, updated_balance: 10)
      account.deposit(10, transaction_class: transaction_class)
    end
    it "adds new transaction to list" do
      expect { account.deposit(10) }.to change { account.transactions.length }.by(1)
    end
  end
end
