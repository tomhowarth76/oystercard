class Oystercard
attr_reader :balance
MAXBALANCE = 90

  def initialize
    @balance = 0
  end

  def topup(amount)
    fail "Over limit of £#{MAXBALANCE}" unless @balance < MAXBALANCE
    @balance += amount
  end
end
