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
    "date || credit || debit || balance"
  end
end
