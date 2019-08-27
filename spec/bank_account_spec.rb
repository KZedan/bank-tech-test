require 'bank_account'

describe BankAccount do
  let (:bankaccount) {described_class.new}

  it "holds deposit with date" do
    amount = 1000
    date = "15/07/1993"
    expect(bankaccount.deposit(amount, date)).to eq ({amount: 1000, date: "15/07/1993"})
  end

  it "allows withdrawals with date" do
    bankaccount.deposit(1000)
    amount = 500
    date = "15/07/1993"
    expect(bankaccount.withdraw(amount, date)).to eq ({balance: 500, date: "15/07/1993"})
  end

end