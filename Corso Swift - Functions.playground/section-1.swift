// Playground - noun: a place where people can play

import UIKit

// MARK: - Functions

func molt(first: Int, second: Int)->Int {
    return first * second
}

molt(1,2)

molt(-1, 2)

molt(2.1, 2)

func noParam()->String { return "nessun parametro"}

noParam()

func maxAndMin(a: Int, b: Int)->(max:Int, min:Int)?{
    var values:(Int,Int)
    
    if a < b {
    values = (b,a)
    } else {
    values = (a,b)
    }
    
    return values
    /*
    if a == b {
        return nil
    }
    return (a > b) ? (a,b) : (b,a)
*/
}

maxAndMin(2, 21)
maxAndMin(2, 2)

/*
func molt(first a:Int,second b:Int)->Int{
    return a*b
}

molt(first: 33, second: 99)
*/

func addChars(var string:String)->String{
    string = "\(string)"+"aaa"
    
    return string
}

var str = "qwerty"
addChars(str)
"\(str)"

func addChars2(inout s:String)->String{
    s = "\(s)"+"aaa"
    
    return s
}

addChars2(&str)
"\(str)"


// MARK: Function Types

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) ->Int = addTwoInts
//var mathFunction = addTwoInts

func printMathResult(function:(Int,Int)->Int, a:Int, b:Int){
    "\(function(a,b))"
}

printMathResult(mathFunction, 7, 3)

// MARK: Function Return Types

func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
var moveNearerToZero = chooseStepFunction(currentValue > 0)

println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")

// MARK: Nested Functions

func chooseStepFunctionNested(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}

currentValue = 10
moveNearerToZero = chooseStepFunctionNested(currentValue>0)
println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")

