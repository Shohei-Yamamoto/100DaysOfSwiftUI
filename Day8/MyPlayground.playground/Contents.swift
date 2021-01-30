import UIKit

// MARK:1

struct Sport {
    var name: String // property
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"
print(tennis.name)


// MARK: 2

struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus) // computed properties return values depending on the other properties

// MARK: 3

struct Progress {
    var task: String
    var amount: Int {
        willSet { // rarely used
            print("willSet to \(amount)")
        }
        didSet { // property observers let you run code before or after any property changes.
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// MARK: 4

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()


// MARK: 5
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

let p1 = Person(name: "Emi")
//p1.makeAnonymous() // error because p1 is constant
//p1.name = "Anonymous" // error

var p2 = Person(name: "Emily")
p2.makeAnonymous()
p2.name = "Anonymous"

// MARK: 6
// String is struct
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// MARK; 7
// Arrays are structs
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())
toys.remove(at: 0)
