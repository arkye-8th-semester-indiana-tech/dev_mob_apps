//: Playground - noun: a place where people can play

import Cocoa

let nameByParkingSpace = [13: "Alice", 27: "Bob"]
if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary!")
}

let space42Assignee: String? = nameByParkingSpace[42]