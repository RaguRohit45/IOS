struct Student {
    let name: String
    let marks: Int
    let dept: String
}

let students = [
    Student(name: "Asha", marks: 82, dept: "IT"),
    Student(name: "Ravi", marks: 35, dept: "CSE"),
    Student(name: "Meena", marks: 91, dept: "IT"),
    Student(name: "Kiran", marks: 56, dept: "ECE"),
    Student(name: "Divya", marks: 67, dept: "CSE"),
    Student(name: "Arjun", marks: 40, dept: "IT")
]

let passedFull = students.filter { student in student.marks >= 40 }
let passedShorthand = students.filter { $0.marks >= 40 }
let names = passedShorthand.map(\.name)
let average = Double(students.map(\.marks).reduce(0, +)) / Double(students.count)
let ranking = students.sorted { $0.marks > $1.marks }
let byDepartment = Dictionary(grouping: students, by: \.dept)

print("Passed: \(passedFull.map(\.name))")
print("Passed using shorthand: \(passedShorthand.map(\.name))")
print("Names: \(names)")
print("Class average: \(average)")
print("Ranking: \(ranking.map { "\($0.name): \($0.marks)" })")
for department in byDepartment.keys.sorted() {
    print("\(department): \(byDepartment[department, default: []].map(\.name))")
}
