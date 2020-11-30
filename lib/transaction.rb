require "date"

class Transaction
  attr_reader :value, :initial_balance, :date

  def initialize(value:, initial_balance:, date: Date.today.strftime)
    @value = value
    @initial_balance = initial_balance
    @date = Date.parse(date)
  end

  def type
    return :debit if @value > 0
    return :credit if @value < 0
  end

  def new_balance
    @initial_balance + @value
  end
end
