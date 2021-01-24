import UIKit


// MARK: 1


let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles: [String] = [john, paul, george, ringo]

beatles[1]
//beatles[7] // crash!!

// MARK: 2

let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])
colors == colors2 // true
type(of: colors)


// MARK: 3
