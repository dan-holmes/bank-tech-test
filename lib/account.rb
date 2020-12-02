require_relative "./transaction"
require_relative "./printer"

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, transaction_class: Transaction, date: Date.today)
    check_valid(value)

    @balance += value
    transaction = transaction_class.new(value: value, updated_balance: @balance, date: date)
    @transactions.push(transaction)
  end

  def withdraw(value, transaction_class: Transaction, date: Date.today)
    deposit_value = -value
    deposit(deposit_value, transaction_class: transaction_class, date: date)
  end

  private

  def check_valid(value)
    raise "Value must be a number." unless value.is_a? Numeric
    raise "You must enter a non-zero amount." if value.zero?
    raise "Insufficient funds for transaction." if (@balance + value).negative?
    raise "You can't deposit or withdraw a fraction of a penny." if value.round(2) != value
  end
end
