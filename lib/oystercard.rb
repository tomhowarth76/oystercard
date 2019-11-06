class Oystercard
attr_reader :balance, :status
MAXBALANCE = 90
MINBALANCE = 1

  def initialize
    @balance = 0
    @status = false
  end

  def topup(amount)
    fail "Over limit of £#{MAXBALANCE}" unless @balance < MAXBALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
   fail "Balance must be over £1" unless @balance > MINBALANCE
    @status = true
  end
  def touch_out
    @status = false
  end
  def in_journey?
    @status
  end
end
