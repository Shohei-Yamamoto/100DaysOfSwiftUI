import UIKit

// MARk: 1
var name = "Tim McGraw"
name = "Romeo"

let name2 = "Tim McGraw"
// name2 = "changed"


// MARK: 2
var name3: String
name3 = "Tim MacGraw"

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

latitude = -1234586.783333


// MARK: 3
var a = 10
a = a + 1
a = a - 1
a = a * a

var names = "Romeo" + " and " + "Tim McGraw"

var c = a + 2

a > c
!(a > c)

// MARK: 4
// String interpolation
"Your name is \(name)"

// MARK: 5
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

songs[0]
type(of: songs)

var songs2: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

print("\(songs2)")

//evenNumbers[5] = 10

// MARK: 6
var person = ["first": "Shohei", "last": "Yamamoto", "month": "July"]
person["month"]

// MARK: 7

var action: String
var person2 = "hater"

if person2 == "hater" {
    action = "hate"
} else {
    action = "like"
}


// MARK: 8
for i in 1...10 {
    print("\(i)")
}

var str = "Fakers gonna"

for _ in 1...5
{
    str += " fake"
}
print(str)


// MARK: 9
let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")
default:
    print("Have you done something new?")
}
