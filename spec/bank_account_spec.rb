require 'bank_account'

describe BankAccount do
  let (:bankaccount) {described_class.new}

  it "holds multiple deposits" do
    bankaccount.deposit(1000, "15/07/1993")
    bankaccount.deposit(500, "14/07/1993")
    expect(bankaccount.transactions).to eq([{date: "15/07/1993", credit: 1000, balance: 1000},
                                            {date: "14/07/1993", credit: 500, balance: 1500}])
  end

  it "allows multiiple withdrawals" do
    bankaccount.deposit(2000, "15/07/1993")
    bankaccount.withdraw(500, "16/07/1993")
    bankaccount.withdraw(1000, "17/07/1993")
    expect(bankaccount.transactions).to eq([{date: "15/07/1993", credit: 2000, balance: 2000},
                                            {date: "16/07/1993", debit: 500, balance: 1500},
                                            {date: "17/07/1993", debit: 1000, balance: 500}])
  end

  it "prints out a statement with transaction history info" do
    bankaccount.deposit(2000.00, "15/07/1993")
    bankaccount.withdraw(500.00, "16/07/1993")
    bankaccount.withdraw(1000.00, "17/07/1993")
    expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n17/07/1993 || || 1000.0 || 500.0\n16/07/1993 || || 500.0 || 1500.0\n15/07/1993 || 2000.0 || || 2000.0")
  end
end 