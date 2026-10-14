import Foundation

var price = 250
let quantity = 3
let taxRate = 0.18

price = 300
let subtotal = Double(price * quantity)
let tax = subtotal * taxRate
let total = subtotal + tax

var title = "Order"
// title = 42 // Error: title is a String, so it cannot be assigned an Int.

print("\(title) total including tax: \(String(format: "%.2f", total))")
