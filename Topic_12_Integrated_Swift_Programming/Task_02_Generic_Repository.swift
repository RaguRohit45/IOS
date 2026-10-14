protocol Entity {
    var id: Int { get }
}

enum RepositoryError: Error {
    case duplicateID(Int)
    case notFound(Int)
}

struct Repository<T: Entity> {
    private var storage: [Int: T] = [:]

    mutating func add(_ item: T) throws {
        guard storage[item.id] == nil else { throw RepositoryError.duplicateID(item.id) }
        storage[item.id] = item
    }

    func find(_ id: Int) -> T? {
        storage[id]
    }

    mutating func remove(_ id: Int) throws {
        guard storage.removeValue(forKey: id) != nil else { throw RepositoryError.notFound(id) }
    }

    func all(where predicate: (T) -> Bool) -> [T] {
        storage.values.filter(predicate).sorted { $0.id < $1.id }
    }
}

struct Student: Entity {
    let id: Int
    let name: String
    let marks: Int
}

struct Course: Entity {
    let id: Int
    let title: String
}

var students = Repository<Student>()
do {
    try students.add(Student(id: 2, name: "Ravi", marks: 75))
    try students.add(Student(id: 1, name: "Asha", marks: 92))
    try students.add(Student(id: 1, name: "Duplicate", marks: 50))
} catch {
    print("Student repository error: \(error)")
}
print("High scorers: \(students.all { $0.marks >= 80 }.map(\.name))")
print("Student 2: \(students.find(2)?.name ?? "Not found")")

var courses = Repository<Course>()
do {
    try courses.add(Course(id: 101, title: "Swift"))
    try courses.add(Course(id: 102, title: "iOS Development"))
    print("Courses: \(courses.all { _ in true }.map(\.title))")
    try courses.remove(101)
} catch {
    print("Course repository error: \(error)")
}
