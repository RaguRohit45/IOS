import Foundation

let nineFifths = 9.0 / 5.0
let offset = 273.15
var celsius = 25.0

func printTemperatures(_ celsius: Double) {
    let fahrenheit = celsius * nineFifths + 32
    let kelvin = celsius + offset
    print("Celsius: \(String(format: "%.1f", celsius))°C")
    print("Fahrenheit: \(String(format: "%.1f", fahrenheit))°F")
    print("Kelvin: \(String(format: "%.1f", kelvin)) K")
}

printTemperatures(celsius)
celsius = 30.0
printTemperatures(celsius)
