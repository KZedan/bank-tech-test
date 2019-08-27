require 'bank_account'

describe BankAccount do
  let (:bankaccount) {described_class.new}

  it "holds multiple deposits" do
    bankaccount.deposit(1000, "15/07/1993")
    bankaccount.deposit(500, "14/07/1993")
    expect(bankaccount.transactions).to eq([{date: "15/07/1993", credit: 1000, balance: 1000 },
                                            {date: "14/07/1993", credit: 500, balance: 1500}])
  end

  it "allows withdrawals with date" do
    bankaccount.deposit(1000)
    debit = 500
    date = "15/07/1993"
    expect(bankaccount.withdraw(debit, date)).to eq ({balance: 500, date: "15/07/1993"})
  end

end