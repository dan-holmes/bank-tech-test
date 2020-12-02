describe "Making transactions and seeing them in summary" do
  before do
    allow(Date).to receive(:today) { Date.new(2020, 2, 12) }
  end
  it "will create the summary correctly" do
    account = Account.new
    account.deposit(1000)
    account.withdraw(500)
    table = %r"^date || credit || debit || balance\n12/02/2020 || 50.00 || || 50.00\n12/02/2020 || || 20.00 || 30.00$"
    expect { Printer.summary(account.transactions) }.to output(table).to_stdout
  end
  context "setting custom dates" do
    it "will create the summary correctly" do
      account = Account.new
      account.deposit(1000, date: Date.new(2020, 11, 1))
      account.withdraw(500, date: Date.new(2020, 11, 2))
      table = %r"^date || credit || debit || balance\n01/11/2020 || 50.00 || || 50.00\n02/11/2020 || || 20.00 || 30.00$"
      expect { Printer.summary(account.transactions) }.to output(table).to_stdout
    end
  end
end
