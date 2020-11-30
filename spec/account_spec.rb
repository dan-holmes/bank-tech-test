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

  describe ".withdraw" do
    before do
      account.deposit(50)
    end
    it "decreases the balance by the given amount" do
      expect { account.withdraw(10) }.to change { account.balance }.by(-10)
    end
    it "create a new transaction with given value and updated balance" do
      expect(transaction_class).to receive(:new).with(value: -10, updated_balance: 40)
      account.withdraw(10, transaction_class: transaction_class)
    end
    it "adds new transaction to list" do
      expect { account.withdraw(10) }.to change { account.transactions.length }.by(1)
    end
  end

  describe ".summary" do
    context "when there are no transaction" do
      it "creates the headers date, credit, debit and balance" do
        expect { account.summary }.to output(/date || credit || debit || balance/).to_stdout
      end
    end
    context "when there is a deposit" do
      let(:transaction1) {
        double(:transaction,
               date: Date.new(2020, 1, 1),
               credit_formatted: "50.00",
               debit_formatted: nil,
               updated_balance_formatted: "100.00")
      }
      before do
        allow(transaction_class).to receive(:new) { transaction1 }
        account.deposit(50, transaction_class: transaction_class)
      end
      it "outputs the date, credit, debit and balance for that transaction" do
        expect { account.summary }.to output(%r"^01/01/2020 || 50.00 || || 100.00$").to_stdout
      end
      it "outputs a line break between each row, and after the header" do
        account.deposit(50, transaction_class: transaction_class)
        table = %r"^date || credit || debit || balance\n01/01/2020 || 50.00 || || 100.00\n01/01/2020 || 50.00 || || 100.00$"
        expect { account.summary }.to output(table).to_stdout
      end
    end
  end
end
