require_relative "./transaction"

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, transaction_class: Transaction, date: Date.today)
    raise "Value must be a number." if !value.is_a? Numeric
    raise "You must enter a non-zero amount." if value == 0
    raise "Insufficient funds for transaction." if @balance + value < 0
    raise "You can't deposit or withdraw a fraction of a penny." if value.round(2) != value

    @balance += value
    transaction = transaction_class.new(value: value, updated_balance: @balance, date: date)
    @transactions.push(transaction)
  end

  def withdraw(value, transaction_class: Transaction, date: Date.today)
    deposit_value = -value
    deposit(deposit_value, transaction_class: transaction_class, date: date)
  end

  def summary
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      transaction_array = convert_to_array(transaction)
      puts convert_to_row(transaction_array)
    end
  end

  private

  def convert_to_array(transaction)
    [
      transaction.date.strftime("%d/%m/%Y"),
      transaction.credit_formatted,
      transaction.debit_formatted,
      transaction.updated_balance_formatted,
    ]
  end

  def convert_to_row(array)
    seperated_array = array.zip(Array.new(3, "||")).flatten
    seperated_array = seperated_array.compact
    seperated_array.join(" ")
  end
end
