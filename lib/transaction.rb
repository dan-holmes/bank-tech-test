require "date"

class Transaction
  attr_reader :value, :updated_balance, :date

  def initialize(value:, updated_balance:, date: Date.today)
    @value = value.to_f
    @updated_balance = updated_balance.to_f
    @date = date
  end

  def debit_formatted
    format_currency(debit)
  end

  def credit_formatted
    format_currency(credit)
  end

  def updated_balance_formatted
    format_currency(@updated_balance)
  end

  private

  def debit
    value if @value.positive?
  end

  def credit
    -value if @value.negative?
  end

  def format_currency(float)
    return nil if float.nil?

    "%.2f" % float
  end
end
