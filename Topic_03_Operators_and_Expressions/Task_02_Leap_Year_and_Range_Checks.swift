let years = [1900, 2000, 2024, 2026]
for year in years {
    let isLeapYear = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    print("\(year) is leap year: \(isLeapYear)")
}

let number = 42
print("Between 1 and 100: \((1...100).contains(number))")

let evenNumber = 24
print("Even and not multiple of 10: \(evenNumber % 2 == 0 && evenNumber % 10 != 0)")

let nickname: String? = nil
print("Nickname: \(nickname ?? "Guest")")
