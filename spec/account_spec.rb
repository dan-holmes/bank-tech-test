require "account"

describe Account do
  let(:account) { Account.new }
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
  end
end
