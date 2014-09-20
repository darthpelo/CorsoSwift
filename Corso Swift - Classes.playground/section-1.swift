// Playground - noun: a place where people can play

import UIKit

// MARK: - Enumerations, structs and classes

// MARK: - Enumerations

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var direction = CompassPoint.North

direction = .East

// UIKit example
var cellType = UITableViewCellAccessoryType.DetailButton
cellType = .Checkmark

switch direction {
case .North:
    println("is North")
case .South:
    println("is South")
case .East:
    println("is East")
case .West:
    println("is West")
}

// MARK: Associated Values

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

productBarcode = .QRCode("ASDFGHJKL")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    "UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)."
case .QRCode(let productCode):
    "QR code: \(productCode)."
}

/*
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    "UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)."
case let .QRCode(productCode):
    "QR code: \(productCode)."
}
*/

// MARK: Raw Values

enum CompassPointRaw: Int {
    case North = 0, South, East, West
}

var value = CompassPointRaw.North.toRaw()

switch value {
case 0:
    "is north"
default:
    "not is north"
}


if let possibleValue = CompassPointRaw.fromRaw(4) {
    switch possibleValue {
    case .North:
        "is north"
    default:
        "not is north"
    }
} else {
    "it's ad invalid value: \(3)"
}

// MARK: - Value Types

struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

var pp = Resolution(width: 1, height: 1)
pp.width=2

cinema.width = 2048

let rememberEnumValue = direction

direction = .South

if rememberEnumValue == .East {
    "Remember Value is still East"
}

// MARK: - Reference Types

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

"\(alsoTenEighty.frameRate) \(tenEighty.frameRate)"

let anotherTenEighty = VideoMode()

if anotherTenEighty === alsoTenEighty {
    "refer to same istance of VideMode"
} else if anotherTenEighty === tenEighty {
    "refer to same istance of VideMode"
} else {
    "refer to differente istance"
}


// MARK: - Properties
// MARK: Stored properties

struct PersonalInformations {
    let name: String
    let surname: String
    var age: Int
}

var userOne = PersonalInformations(name: "Peter", surname: "Parker", age: 20)
//userOne.name = "Spider"
userOne.age += 1
"\(userOne.age)"

let userTwo = PersonalInformations(name: "Peter", surname: "Parker", age: 20)
//userTwo.age += 1

// MARK: Computed properties

/*
 Not store a value, instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
*/

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
    get {
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
        origin.x = newCenter.x - (size.width / 2)
        origin.y = newCenter.y - (size.height / 2)
    }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)

"square.origin is now at (\(square.origin.x), \(square.origin.y))"

// MARK: - Methods
// MARK: Instance Methods
/*
methods that are called on an instance of a particular type
*/
// MARK: Type Methods
/*
methods that are called on the type itself
*/

class SomeClass {
    class func someTypeMethod() {
        println("type method implementation goes here")
    }
}

SomeClass.someTypeMethod()

/*
struct LevelTracker {
    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level}
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    // mutating method to change properties value for struct or enum
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    
    let playerName: String
    
    func completedLevel(level: Int) {
        let newLevel = level + 1
        LevelTracker.unlockLevel(level)
        tracker.advanceToLevel(newLevel)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Alessio")
player.completedLevel(111)
LevelTracker.highestUnlockedLevel
*/

// MARK: - Subscripts

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 4, columns: 4)

matrix[0, 0] = 1

matrix[3,3]

// MARK: - Initialization

struct Fahrenheit {
    var temperature = 32.0
}

let temperature = Fahrenheit()

struct Celsius {
    var temperature: Double
}

let tempCelsius = Celsius(temperature: 32.0)

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}

// MARK: - Optional Chaining

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//john.residence = Residence()

let roomCount = john.residence?.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}

// MARK: Defining Model Classes for Optional Chaining

class ComplexPerson {
    var residence: ComplexResidence?
}

class ComplexResidence {
    var rooms = [Room]()
    
    // computetd property
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    // return Void
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

// MARK: Accessing Properties Through Optional Chaining

let emy = ComplexPerson()

//emy.residence = ComplexResidence()

if let roomCount = emy.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"

emy.residence?.address = someAddress
// the attempt to set the address property of john.residence will fail, because john.residence is currently nil.

// MARK: Calling Methods Through Optional Chaining

if (emy.residence?.printNumberOfRooms() != nil) {
    println("It was possible to print the number of rooms.")
} else {
    println("It was not possible to print the number of rooms.")
}

// MARK: Accessing Subscripts Through Optional Chaining
/*
let emysHouse = ComplexResidence()
emysHouse.rooms.append(Room(name: "Living Room"))
emysHouse.rooms.append(Room(name: "Kitchen"))
emy.residence = emysHouse
emy.residence?.address = someAddress
*/  
if let firstRoomName = emy.residence?.rooms[0].name {
    println("The first room name is \(firstRoomName)")
} else {
     println("Unable to retrieve the first room name.")
}

// MARK: Linking Multiple Levels of Chaining

if let emysStreet = emy.residence?.address?.street {
    println("John's street name is \(emysStreet).")
} else {
    println("Unable to retrieve the address.")
}


