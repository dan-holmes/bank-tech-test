require "printer"

describe Printer do
  let(:transaction1) { double(:transaction, debit_formatted: "50.00", credit_formatted: "", updated_balance_formatted: "50.00", date: Date.new(2020, 2, 12)) }
  let(:transaction2) { double(:transaction, debit_formatted: "", credit_formatted: "20.00", updated_balance_formatted: "30.00", date: Date.new(2020, 2, 14)) }
  let(:transactions) { [] }
  describe ".summary" do
    context "when there are no transactions" do
      it "creates the headers date, credit, debit and balance" do
        expect { Printer.summary(transactions) }.to output(%r"^date || credit || debit || balance$").to_stdout
      end
    end
    context "when there are deposits" do
      before do
        transactions.push(transaction1)
        transactions.push(transaction2)
      end
      it "outputs the date, credit, debit and balance for that transaction" do
        expect { Printer.summary(transactions) }.to output(%r{12\/02\/2020 \|\| \|\| 50.00 \|\| 50.00}).to_stdout
      end
      it "outputs deposits in reverse chronological order" do
        expect { Printer.summary(transactions) }.to output(%r{14\/02\/2020.*12\/02\/2020}m).to_stdout
      end
      it "outputs a line break between each row, and after the header" do
        table = "date || credit || debit || balance\n14/02/2020 || 20.00 || || 30.00\n12/02/2020 || || 50.00 || 50.00\n"
        expect { Printer.summary(transactions) }.to output(table).to_stdout
      end
    end
  end
end
