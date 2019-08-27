class BankAccount
  def initialize
    @balance = 0
  end

  def deposit(amount, date = Time.now)
    {amount: @balance += amount, date: date}
  end

  def withdraw(amount, date = Time.now)
    {balance: @balance -= amount, date: date}
  end
end