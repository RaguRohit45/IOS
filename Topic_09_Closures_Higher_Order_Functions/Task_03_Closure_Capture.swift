func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let a = makeCounter()
let b = makeCounter()
print(a(), a(), b(), a())
