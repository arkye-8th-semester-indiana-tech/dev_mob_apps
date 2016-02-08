//: Playground - noun: a place where people can play

import Cocoa

var countingUp = ["one", "two"]
countingUp.append("three")

for var i = 0; i < countingUp.count; i++ {
    let string = countingUp[i]
    // Use 'string'
}

let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    // Use 'string'
}

for string in countingUp {
    // Use 'string'
}

for (i, string) in countingUp.enumerate() {
    // (0, "one"), (1, "two")
}

let nameByParkingSpace = [13: "Alice", 27: "Bob"]

for (space, name) in nameByParkingSpace {
    let permit = "Space \(space): \(name)"
}