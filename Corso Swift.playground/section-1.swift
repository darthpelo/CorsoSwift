// Playground - noun: a place where people can play

import Foundation
import UIKit

/******************************************************/
/*
OPTIONAL
*/

let possibileNumber = "123"
let convertNumber = possibileNumber.toInt()

if convertNumber != nil {
    "It's a number"
} else {
    "It's a string"
}

// Optional Binding

if let isItNumber = possibileNumber.toInt() {
    "It's a number \(isItNumber)"
} else {
    "It's a string"
}

var selectedIndexPath: NSIndexPath?

var alertMessage: String?

// Unwrap

alertMessage = "Alert!"

"\(alertMessage!)"

// Implicitly Unwrapped Optionals 

var myTableView: UITableView! = UITableView()

/******************************************************/
/*
TUPLE
*/

var errorAlert = (404, "Not Found")

"first value:\(errorAlert.0), second value:\(errorAlert.1)"

errorAlert.0 = 201
//errorAlert.o = "201"

// 1
/*
var (statusNumber, statusMessage) = errorAlert

"\(statusNumber) - \(statusMessage)"
*/
// 2

let http200status = (statusNumber:200, statusMessage:"OK")
"\(http200status.statusMessage)"

/******************************************************/
/*
Array
*/

let staticArray = [1,2,3,4]

//staticArray.append(5)

var mutableArray=[Int]()

mutableArray.append(2)

mutableArray.append(3)

//mutableArray += [4,5,6]
//mutableArray.insert(1, atIndex: 0)
//mutableArray[2...4] = [0]
//mutableArray[2...4] = [0,0]
//mutableArray[2..<4] = [0,0]

"ho \(mutableArray.count) elementi"

for var index = 0; index < mutableArray.count; ++index {
    "index is \(mutableArray[index])"
}

mutableArray = []

if mutableArray.isEmpty {
    "Array vuoto"
} else {
    "Array con elementi"
}

for index in 0...10 {
    mutableArray.append(index)
}
"ho \(mutableArray.count) elementi"

for index in mutableArray {
    "\(index)"
}

for (index, value) in enumerate(mutableArray) {
    "Item \(index+1): \(value)"
}

/******************************************************/
/*
Dictionary
*/

var airports: [String: String] = ["TYO": "Tokyo", "DUB": "Dublin"]

var airports2 = ["TYO": "Tokyo", "DUB": "Dublin"]

var airports3 = [String: String]()

airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}

airports["XYZ"] = "Cologno"

"\(airports.count)"

airports["XYZ"] = nil

//airports.removeValueForKey("XYZ")

for (airportcode, airportname) in airports {
    println("\(airportcode):\(airportname)")
}

for (airportcode) in airports.keys {
    println("\(airportcode)")
}

for (airportname) in airports.values {
   println("\(airportname)")
}

/* From dictionaries value to array */

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

/******************************************************/
/*
Switch Case
*/

switch airportCodes[0] {
case "DUB":
    "Dublin"
case "TYO":
    "Tokyo"
case "ZXY":
    "Cupertino"
default:
    "No values"
}

/*
switch airportCodes[1] {
case "DUB",
"TYO":
"Tokyo"
case "ZXY":
"Cupertino"
default:
"No values"
}
*/

let bigNumber = 3_000_000

switch bigNumber {
case 1...100:
    "100"
case 101...500:
    "500"
case 501...1_000_000:
    "1000000"
default:
    "Big Number!"
}


let coordinate = (1.0, 1.0)

switch coordinate {
case (0,0):
    "(0,0)"
case (_,1):
    "second value match"
//case (_, -10...10):
//    "inside here"
default:
    "No match"
}

/*
Value bindings
*/

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhere else at (\(x), \(y))")
}


