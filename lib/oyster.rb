class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  DEFAULT_BALANCE = 0

  attr_reader :balance, :in_journey
 
  def initialize(balance = DEFAULT_BALANCE)
    @balance = 0
    @in_journey = false
  end 

  def top_up(amount)
      fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
      @balance += amount
  end    

  def deduct_fare(amount)
    @balance -= amount
  end

  def touch_in
    raise "Insufficient balance to touch in" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end