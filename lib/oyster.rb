class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance, :in_journey
 
  def initialize(balance = MAX_BALANCE)
    @balance = 0
    @in_journey = false
  end 

  def top_up(amount)
      fail 'Your card has hit the limit!' if amount + balance > MAX_BALANCE 
      @balance += amount
  end    

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end
end