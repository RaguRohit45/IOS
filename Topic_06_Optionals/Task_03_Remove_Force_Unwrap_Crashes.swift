let scores = ["Asha": 90, "Ravi": 72]

if let kiran = scores["Kiran"] {
    if let number = Int("12a") {
        print(kiran + number)
    } else {
        print("The number is invalid.")
    }
} else {
    print("No score found for Kiran.")
}

if let number = Int("42") {
    print("Valid number: \(number)")
}
