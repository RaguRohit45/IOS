func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { value in value * factor }
}

func apply(_ values: [Int], using transform: (Int) -> Int) -> [Int] {
    values.map(transform)
}

let values = [1, 2, 3, 4]
let double = makeMultiplier(2)
let triple = makeMultiplier(3)

print("Doubled: \(apply(values, using: double))")
print("Tripled: \(apply(values, using: triple))")
print("Squared: \(apply(values) { $0 * $0 })")
