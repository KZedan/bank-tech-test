class BankAccount
  def deposit(amount, date = Time.now)
    {amount: amount, date: date}
  end
end