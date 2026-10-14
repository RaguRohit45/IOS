protocol Entity {
    var id: Int { get }
}

protocol Describable {
    var summary: String { get }
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

    func find(_ id: Int) -> T? { storage[id] }

    mutating func remove(_ id: Int) throws {
        guard storage.removeValue(forKey: id) != nil else { throw RepositoryError.notFound(id) }
    }

    func all(where predicate: (T) -> Bool) -> [T] {
        storage.values.filter(predicate).sorted { $0.id < $1.id }
    }
}

extension Repository where T: Describable {
    func printReport() {
        for item in all(where: { _ in true }) {
            print(item.summary)
        }
    }
}

struct Student: Entity, Describable {
    let id: Int
    let name: String
    let marks: Int
    var summary: String { "Student #\(id): \(name), marks \(marks)" }
}

struct Course: Entity, Describable {
    let id: Int
    let title: String
    var summary: String { "Course #\(id): \(title)" }
}

struct PlainRecord: Entity {
    let id: Int
}

var studentRepository = Repository<Student>()
try? studentRepository.add(Student(id: 1, name: "Asha", marks: 92))
try? studentRepository.add(Student(id: 2, name: "Ravi", marks: 75))
studentRepository.printReport()

var courseRepository = Repository<Course>()
try? courseRepository.add(Course(id: 101, title: "Swift"))
courseRepository.printReport()

let plainRepository = Repository<PlainRecord>()
// plainRepository.printReport() // Does not compile because PlainRecord is not Describable.
print("PlainRecord repository has no printReport() method.")
