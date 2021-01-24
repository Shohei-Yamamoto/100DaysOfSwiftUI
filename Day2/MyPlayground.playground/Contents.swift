import UIKit


// MARK: 1
// use When you need a collections of duplicate values or the order matters.

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles: [String] = [john, paul, george, ringo]

beatles[1]
//beatles[7] // crash!!

// MARK: 2
// use When you need a collection of values that must be unique or  you need to check the existence of specific item extremely quickly.

let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])
colors == colors2 // true
type(of: colors)


// MARK: 3
// use When you need fixed collection of related values where each item has a precise position or name.

var name = (first: "Taylor", last: "Swift")
name.0
name.first

name.first = "Tylor"
//name.first = 28 // error no change of type
// name.age = 29 // error no field
name

// MARK: 5

let heights: [String: Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]

// MARK: 6
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["A"] // nil
favoriteIceCream["A", default: "Unknown"] // Unknown


// MARK: 7

var teams = [String: String]() // empty dictionaly
teams["Paul"] = "Red"

var results = [Int]()
var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
results = Array<Int>()

// MARK: 8

enum Result {
    case success
    case failure
}

Result.failure
// MARK: 9
enum Activity {
    case bored
    case running
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
talking

switch talking {
case .talking(let topic):
    print(topic)
default:
    print("a")
}

// MARK: 10

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2) // venus
