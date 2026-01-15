import UIKit

var greeting = "Hello, playground"

// Comment Here
/*
 Comment Line 1
 Comment Line 2
 */


// Explicity Declaring Variables
var explicitInt: Int = Int(5)
let stringNumber: String = String(5.0)

print(explicitInt)


// You can add Strings together
let str = "Hello World"
let newString = str + stringNumber

// Swift has all the typical math operators
// + - / * %


// Arrays
var arr = ["Apple", "Banana", "Cherry"]
var arr2: [String] = ["Eggs"]

// Looping over arrays while keeping track of the index
for (index, value) in arr.enumerated() {
    print(index)
    print(value)
}


// One way to deal with optionals is using an if let
if let lastElementOfArr2 = arr2.popLast() {
    // If the result is not nil we will end up here
    print(lastElementOfArr2)
    print("Nice!")
} else {
    // If the result is not nil we will end up here
    print("Its empty!")
}

// Nil Coalescing is another way to deal with options
// Its adding a fallback value
let nonOptionalElementOfArr2 = arr2.popLast() ?? "N/A"

// For in arrays are one of the most common types of ways to loop over an array in swift
for fruit in arr {
    print(fruit)
}

// You can also have numeral values for arrays
// This is <5, 1...5 is <=5
for index in 1..<5 {
    print(index)
}


var stringThatsNotANumber = "5"
// Sometimes converting one data type to another is optional
if let num = Int(stringThatsNotANumber) {
    print("Succeed")
} else {
    print("Fail")
}


var i = 0
var j = 1
if i < 1 || j < 1 {
    print("Passes the OR check")
} else if i < 5,  j < 5 {
    print("Passes the AND check")
} else {
    print("Failed both checks")
}

// A while loop! You don't need the <
while i < 5 {
    i += 1
}

//Nil coalesce with a functional call
let tempOutside = temperatureOutsideWithoutFail(temp: 15)
print("Temp Outside")
print(tempOutside)
            
// Function Call that takes in a parameter and returns a string
func temperatureOutsideWithoutFail(temp: Int) -> String {
    if temp < 32 {
        return "Its Cold"
    } else if temp < 75 {
        return "Its Medium"
    } else if temp < 100 {
        return "Its Hot"
    } else {
        return "You're on Venus"
    }
}

let optionalTempOutside = temperatureOutsideThatCanFail(temp: 95) ?? "N/A"
print("Optional Temp Outside")
print(optionalTempOutside)

// Function Call that takes in a parameter and returns a string
func temperatureOutsideThatCanFail(temp: Int) -> String? {
    if temp < 32 {
        return "Its Cold"
    } else if temp < 75 {
        return "Its Medium"
    } else if temp < 100 {
        return nil
    } else {
        return "You're on Venus"
    }
}

// A Switch statement based off an int
// Switches only execute the case that is passed, unless you call fallthrough
print("No fallthrough")
switchVariable(switchVariable: 10)
print("With fallthrough")
switchVariable(switchVariable: 30)


func switchVariable(switchVariable: Int) {
    switch switchVariable {
        case 10: print("10")
        case 20: print("20")
        case 30: print("30")
        fallthrough
        case 40: print("40")
        default: print("fallthrough")
    }
}



// Dictionary Syntax
var dict: [Int:Bool] = [
    1: true,
    2: false,
    3: true,
]
// You can loop through dictionaries using for in loops
for (key,value) in dict {
    print(key)
    print(value)
}
