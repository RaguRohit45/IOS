struct Address {
    var city: String?
}

struct User {
    var name: String
    var age: Int?
    var address: Address?
}

func describe(_ user: User) -> String {
    guard let age = user.age else {
        return "\(user.name): age unknown"
    }
    let city = user.address?.city ?? "unknown city"
    return "\(user.name), age \(age), city \(city)"
}

let completeUser = User(name: "Asha", age: 21, address: Address(city: "Chennai"))
let noAgeUser = User(name: "Ravi", age: nil, address: Address(city: "Madurai"))
let noCityUser = User(name: "Meena", age: 20, address: Address(city: nil))

print(describe(completeUser))
print(describe(noAgeUser))
print(describe(noCityUser))
print(String(describing: Int("42")))
print(String(describing: Int("abc")))
