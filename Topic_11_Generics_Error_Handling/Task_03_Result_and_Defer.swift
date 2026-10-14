enum AgeError: Error {
    case empty
    case notANumber
    case outOfRange
}

func parseAge(_ text: String) throws -> Int {
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { throw AgeError.empty }
    guard let age = Int(trimmed) else { throw AgeError.notANumber }
    guard (1...120).contains(age) else { throw AgeError.outOfRange }
    return age
}

let result = Result { try parseAge("25") }
switch result {
case .success(let age):
    print("Parsed age: \(age)")
case .failure(let error):
    print("Could not parse age: \(error)")
}

func saveReport(shouldFail: Bool = false) throws {
    print("Opening file")
    defer { print("Closing file") }
    if shouldFail { throw AgeError.notANumber }
    print("Saving report")
}

do {
    try saveReport(shouldFail: true)
} catch {
    print("Save failed: \(error)")
}
