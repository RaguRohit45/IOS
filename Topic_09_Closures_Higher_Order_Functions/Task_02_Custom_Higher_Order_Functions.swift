func myFilter(_ items: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for item in items {
        if predicate(item) { result.append(item) }
    }
    return result
}

func applyTwice(_ value: Int, _ f: (Int) -> Int) -> Int {
    f(f(value))
}

final class Button {
    private var handlers: [() -> Void] = []

    func onTap(_ handler: @escaping () -> Void) {
        handlers.append(handler)
    }

    func tap() {
        for handler in handlers { handler() }
    }
}

print(myFilter([1, 2, 3, 4, 5], { $0 % 2 == 0 }))
print(applyTwice(3, { $0 + 2 }))

let button = Button()
button.onTap { print("First handler") }
button.onTap { print("Second handler") }
button.tap()
