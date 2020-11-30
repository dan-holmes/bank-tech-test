require "account"

describe Account do
  describe "initialize" do
    let(:account) { Account.new }
    it "sets balance to 0" do
      expect(account.balance).to eq 0
    end
  end
end
