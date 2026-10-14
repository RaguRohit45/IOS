enum BookStatus {
    case available
    case borrowed(by: String, dueIns: Int)
    case reserved(for: String)

    var label: String {
        switch self {
        case .available:
            return "Available"
        case .borrowed(let name, let days):
            return "Borrowed by \(name), due in \(days) days"
        case .reserved(let name):
            return "Reserved for \(name)"
        }
    }
}

struct Book {
    var title: String
    var status: BookStatus = .available
}

final class Member {
    var name: String
    var borrowedBooks: [String]

    init(name: String, borrowedBooks: [String] = []) {
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
}

var originalBook = Book(title: "Swift Basics")
var copiedBook = originalBook
copiedBook.status = .borrowed(by: "Asha", dueIns: 7)
print("\(originalBook.title): \(originalBook.status.label)")
print("\(copiedBook.title): \(copiedBook.status.label)")

let member1 = Member(name: "Ravi")
let member2 = member1
member2.name = "Kiran"
print(member1.name)
print(member2.name)
