import UIKit

// MARK: 1
var str = "Hello, playground"
str = "Goodbye"
str = "a"

// MARK: 2
// Swift is known as a type-safe langage, every variable must be of one specific type.
var age = 38
var population = 8_000_000
// str = 33 // typeが違うためできない


// MARK: 3


// 3 lines
var str1 = """
This goes
over multiple
lines
"""

// one line
var str2 = """
This goes \
over multiple \
lines
"""

// backslash cancels new line. Bacslash new line at the last line is not allowed.
//print(str1)
//print(str2)

// MARK: 4

// Swift automatically gives that variable the type Double whenever you create a variable with fractional number
var pi = 3.14

// true of false  => boolean
var awesome = true


// MARK: 5

// string interpolation
var score = 85
var strScore = "your score was \(score)"
var results = "The test results are here: \(strScore)"

// MARK: 6

let taylor = "swift"

// MARK: 7

let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

