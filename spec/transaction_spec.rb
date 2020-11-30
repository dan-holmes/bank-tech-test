require "transaction"

describe Transaction do
  it "Is initialized with a value" do
    transaction = Transaction.new(10)
    expect(transaction.value).to eq 10
  end
end
