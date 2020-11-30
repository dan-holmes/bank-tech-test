class Transaction
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def type
    return :debit if @value > 0
    return :credit if @value < 0
  end
end
