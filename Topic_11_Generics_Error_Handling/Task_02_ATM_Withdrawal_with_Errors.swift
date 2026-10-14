enum ATMError: Error {
    case insufficientFunds(shortBy: Double)
    case invalidAmount
    case dailyLimitExceeded(limit: Double)
}

struct Account {
    var balance: Double
    private(set) var withdrawnToday: Double = 0
    let dailyLimit: Double = 20_000

    mutating func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw ATMError.invalidAmount }
        guard withdrawnToday + amount <= dailyLimit else {
            throw ATMError.dailyLimitExceeded(limit: dailyLimit)
        }
        guard amount <= balance else {
            throw ATMError.insufficientFunds(shortBy: amount - balance)
        }
        balance -= amount
        withdrawnToday += amount
    }
}

func describe(_ error: ATMError) -> String {
    switch error {
    case .insufficientFunds(let shortBy):
        return "Insufficient funds; short by \(shortBy)."
    case .invalidAmount:
        return "Amount must be positive."
    case .dailyLimitExceeded(let limit):
        return "Daily withdrawal limit is \(limit)."
    }
}

var account = Account(balance: 10_000)
for amount in [500.0, -10.0, 25_000.0, 12_000.0] {
    do {
        try account.withdraw(amount)
        print("Withdrew \(amount). Balance: \(account.balance)")
    } catch let error as ATMError {
        print("Withdrawal failed: \(describe(error))")
    } catch {
        print("Unexpected error: \(error)")
    }
}

let optionalResult = try? account.withdraw(100)
print("Optional withdrawal result is nil: \(optionalResult == nil)")
