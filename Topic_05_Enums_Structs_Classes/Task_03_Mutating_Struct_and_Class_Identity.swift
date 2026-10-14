struct Counter {
    var value = 0
    mutating func increment() {
        value += 1
    }
}

final class Box {
    var value = 0
    func increment() {
        value += 1
    }
}

var c = Counter()
c.increment()
print("Struct counter: \(c.value)")

let b = Box()
b.increment()
let anotherB = b
anotherB.increment()
print("Class value through b: \(b.value)")
print("Same object: \(b === anotherB)")
