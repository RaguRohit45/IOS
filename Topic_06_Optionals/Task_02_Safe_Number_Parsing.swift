let entries = ["10", "x", "25", "", "7.5", "40"]
let parsed = entries.compactMap(Int.init)
let invalidCount = entries.count - parsed.count
let sum = parsed.reduce(0, +)
let firstDoubled = Int(entries.lazy.compactMap(Int.init).first ?? 0) * 2

print("Valid integers: \(parsed)")
print("Sum: \(sum)")
print("Invalid entries: \(invalidCount)")
if let firstValid = entries.lazy.compactMap(Int.init).first {
    print("First valid number doubled: \(firstValid * 2)")
} else {
    print("No valid integers")
}
