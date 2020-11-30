require "account"

describe Account do
  describe "initialize" do
    let(:account) { Account.new }
    it "sets balance to 0" do
      expect(account.balance).to eq 0
    end
    it "creates an empty list of transactions" do
      expect(account.transactions).to be_empty
    end
  end
end
