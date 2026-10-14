let swiftClub: Set<String> = ["Anu", "Ben", "Chitra", "Dev"]
let uiClub: Set<String> = ["Chitra", "Dev", "Esha"]

print("Both clubs: \(swiftClub.intersection(uiClub).sorted())")
print("Swift club only: \(swiftClub.subtracting(uiClub).sorted())")
print("Everyone: \(swiftClub.union(uiClub).sorted())")
print("Exactly one club: \(swiftClub.symmetricDifference(uiClub).sorted())")

let numbers = [3, 1, 3, 2, 1, 4]
var seen = Set<Int>()
let uniqueInOrder = numbers.filter { seen.insert($0).inserted }
print("Unique in original order: \(uniqueInOrder)")
