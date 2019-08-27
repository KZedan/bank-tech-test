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

  def print_statement
    statement = @transactions.map do |transaction|
      if transaction.has_key?(:credit)
       "#{transaction[:date]} || #{transaction[:credit]} || || #{transaction[:balance]}"
      else
       "#{transaction[:date]} || || #{transaction[:debit]} || #{transaction[:balance]}"
      end
    end

    statement.reverse.insert(0, "date || credit || debit || balance").join("\n")
  end
end