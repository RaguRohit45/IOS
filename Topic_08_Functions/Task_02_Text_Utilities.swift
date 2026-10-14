import Foundation

func isPalindrome(_ text: String) -> Bool {
    let normalized = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return normalized == String(normalized.reversed())
}

func vowelCount(in text: String) -> Int {
    text.lowercased().filter { "aeiou".contains($0) }.count
}

func wordCount(in text: String) -> Int {
    text.split { !$0.isLetter && !$0.isNumber }.count
}

func wordCount(in text: String, minLength: Int) -> Int {
    text.split { !$0.isLetter && !$0.isNumber }
        .filter { $0.count >= minLength }.count
}

let sample = "A man, a plan, a canal: Panama"
print("Palindrome: \(isPalindrome(sample))")
print("Vowels: \(vowelCount(in: sample))")
print("Words: \(wordCount(in: sample))")
print("Words with at least 4 letters: \(wordCount(in: sample, minLength: 4))")
