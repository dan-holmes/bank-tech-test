class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, transaction_class: Transaction)
    @balance += value
    transaction_class.new(value: value, updated_balance: @balance)
  end
end
