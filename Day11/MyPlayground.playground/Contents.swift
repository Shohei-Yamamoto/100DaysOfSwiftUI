import UIKit


// MARK: 1
// Protocols are a way of describing what properties and methods something must have.


protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

displayID(thing: User(id: "ID!"))

// MARK: 2
// protocol inheritance. you can inherit from multiple protocols at the same time.
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// MARK: 3
// extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

8.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

8.isEven


// MARK: 4
// Protocol let you describe what methods something should have, but don't provide the code inside.

// protocol extension affect all conforming types

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()


// MARK: 5
// protocol-oriented programming
// crafting your code around protocols and protocol extensions

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()
