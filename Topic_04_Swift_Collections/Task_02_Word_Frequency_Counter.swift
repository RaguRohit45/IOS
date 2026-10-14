let sentence = "swift is fun and swift is fast"
let words = sentence.split(separator: " ").map(String.init)
var frequency: [String: Int] = [:]

for word in words {
    frequency[word, default: 0] += 1
}

print("Word count: \(words.count)")
print("Unique words: \(Set(words).sorted())")
for (word, count) in frequency.sorted(by: { $0.key < $1.key }) {
    print("\(word): \(count)")
}
let ranked = frequency.sorted {
    if $0.value == $1.value { return $0.key < $1.key }
    return $0.value > $1.value
}
print("Ranked: \(ranked.map { "\($0.key): \($0.value)" })")
