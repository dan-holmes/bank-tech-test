class Transaction
  attr_reader :value, :initial_balance

  def initialize(value:, initial_balance:)
    @value = value
    @initial_balance = initial_balance
  end

  def type
    return :debit if @value > 0
    return :credit if @value < 0
  end
end
