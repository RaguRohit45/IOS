final class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) { self.name = name }
    deinit { print("Person \(name) deallocated") }
}

final class Apartment {
    let unit: String
    weak var tenant: Person?

    init(unit: String) { self.unit = unit }
    deinit { print("Apartment \(unit) deallocated") }
}

do {
    var person: Person? = Person(name: "Asha")
    var apartment: Apartment? = Apartment(unit: "A-101")
    person?.apartment = apartment
    apartment?.tenant = person
    person = nil
    apartment = nil
}
print("End of scope")
