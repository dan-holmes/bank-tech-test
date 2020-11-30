class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, transaction_class: Transaction)
    @balance += value
    transaction = transaction_class.new(value: value, updated_balance: @balance)
    @transactions.push(transaction)
  end

  def withdraw(value, transaction_class: Transaction)
    deposit_value = -value
    deposit(deposit_value, transaction_class: transaction_class)
  end

  def summary
    output = "date || credit || debit || balance"
    @transactions.each do |transaction|
      if transaction.type == :credit
        credit = "%.2f" % transaction.absValue
        debit = nil
      else
        credit = nil
        debit = "%.2f" % transaction.absValue
      end
      transaction_array = [transaction.date.strftime("%d/%m/%Y"), credit, debit, "%.2f" % transaction.updated_balance]
      zipped_array = transaction_array.zip(Array.new(3, "||")).flatten
      compact_zipped_array = zipped_array.compact
      transaction_string = compact_zipped_array.join(" ")
      output += '\n' + transaction_string
    end
    output
  end
end
