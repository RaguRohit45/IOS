protocol Flyable {
    func fly()
}

protocol Swimmable {
    func swim()
}

struct Duck: Flyable, Swimmable {
    func fly() { print("Duck flies") }
    func swim() { print("Duck swims") }
}

struct Eagle: Flyable {
    func fly() { print("Eagle flies") }
}

struct Fish: Swimmable {
    func swim() { print("Fish swims") }
}

func showOff(_ animal: any Flyable & Swimmable) {
    animal.fly()
    animal.swim()
}

showOff(Duck())
Eagle().fly()
Fish().swim()
