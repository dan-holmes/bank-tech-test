require "date"

class Transaction
  attr_reader :value, :updated_balance, :date

  def initialize(value:, updated_balance:, date: Date.today)
    @value = value
    @updated_balance = updated_balance
    @date = date
  end

  def type
    return :debit if @value > 0
    return :credit if @value < 0
  end
end
