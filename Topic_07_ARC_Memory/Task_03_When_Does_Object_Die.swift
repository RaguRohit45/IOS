final class Box {
    deinit { print("Box gone") }
}

var a: Box? = Box()
var b = a
var c = a
a = nil
b = nil
print("before c")
c = nil
print("end")
