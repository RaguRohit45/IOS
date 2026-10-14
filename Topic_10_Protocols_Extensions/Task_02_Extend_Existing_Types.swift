extension Int {
    var isEven: Bool { self % 2 == 0 }
    func squared() -> Int { self * self }
}

extension Array where Element == Int {
    var sum: Int { reduce(0, +) }
}

extension String {
    var wordCount: Int { split { $0.isWhitespace }.count }
}

struct Version: Comparable {
    let major: Int
    let minor: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major != rhs.major { return lhs.major < rhs.major }
        return lhs.minor < rhs.minor
    }
}

print("8 is even: \(8.isEven)")
print("5 squared: \(5.squared())")
print("Array sum: \([1, 2, 3, 4].sum)")
print("Word count: \("Swift is easy".wordCount)")
let versions = [Version(major: 2, minor: 0), Version(major: 1, minor: 9), Version(major: 1, minor: 10)]
for version in versions.sorted() { print("\(version.major).\(version.minor)") }
