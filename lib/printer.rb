class Printer
  def self.summary(transactions)
    print_header
    transactions.sort_by! { |t| t.date }.reverse!
    transactions.each do |transaction|
      print_transaction(transaction)
    end
  end

  private

  def self.print_header
    puts "date || credit || debit || balance"
  end

  def self.print_transaction(transaction)
    transaction_array = convert_to_array(transaction)
    puts convert_to_row(transaction_array)
  end

  def self.convert_to_array(transaction)
    [
      transaction.date.strftime("%d/%m/%Y"),
      transaction.credit_formatted,
      transaction.debit_formatted,
      transaction.updated_balance_formatted,
    ]
  end

  def self.convert_to_row(array)
    seperated_array = array.zip(Array.new(3, "||")).flatten
    seperated_array.reject! { |e| e.nil? || e == "" }
    seperated_array.join(" ")
  end
end
