//: Playground - noun: a place where people can play

import Cocoa

enum PieType: Int {
    case Apple = 0
    case Cherry
    case Pecan
}

let pieRawValue = PieType.Pecan.rawValue
// pieRawValue is an Int with a value of 2

if let pieType = PieType(rawValue: pieRawValue) {
    // Got a valid 'pieType'!
}