struct Stack<Element> {
    private var items: [Element] = []

    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
    var top: Element? { items.last }

    mutating func push(_ item: Element) {
        items.append(item)
    }

    @discardableResult
    mutating func pop() -> Element? {
        items.popLast()
    }
}

func largest<T: Comparable>(in items: [T]) -> T? {
    items.max()
}

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}

var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
print("Int stack top: \(intStack.top ?? 0), count: \(intStack.count)")
print("Popped: \(intStack.pop() ?? 0)")

var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("iOS")
print("String stack top: \(stringStack.top ?? "none")")
print("Largest integer: \(largest(in: [3, 9, 4]) ?? 0)")
print("Largest string: \(largest(in: ["apple", "pear", "banana"]) ?? "none")")

var first = 1
var second = 2
swapValues(&first, &second)
print("Swapped: \(first), \(second)")
