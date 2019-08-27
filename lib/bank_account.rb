class BankAccount
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(credit, date = Time.now)
    @transactions.push({date: date, credit: credit, balance: @balance += credit})
  end

  def withdraw(debit, date = Time.now)
    @transactions.push({date: date, debit: debit, balance: @balance -= debit})
  end
end