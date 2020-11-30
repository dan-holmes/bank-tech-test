class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, transaction_class: Transaction)
    transaction_class.new(value: value, initial_balance: @balance)
    @balance += value
  end
end
