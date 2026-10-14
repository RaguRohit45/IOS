var subjects = ["Swift", "UIKit", "SwiftUI"]
subjects.append("Networking")
subjects.insert("Testing", at: 1)
if let index = subjects.firstIndex(of: "UIKit") {
    subjects.remove(at: index)
}
print("Sorted subjects: \(subjects.sorted())")

var registered: Set<String> = ["Asha", "Ravi"]
registered.insert("Asha")
registered.insert("Asha")
print("Unique student count: \(registered.count)")

var marks: [String: Int] = ["Asha": 90, "Ravi": 82, "Meena": 95]
marks["Kiran"] = 88
marks["Ravi"] = 85
print("Kiran's mark: \(String(describing: marks["Kiran"] ?? nil))")

for (name, mark) in marks.sorted(by: { $0.key < $1.key }) {
    print("\(name): \(mark)")
}
if let top = marks.max(by: { $0.value < $1.value }) {
    print("Highest mark: \(top.value), Student: \(top.key)")
}
