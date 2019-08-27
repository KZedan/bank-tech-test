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

end 