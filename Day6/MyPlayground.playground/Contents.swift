import UIKit


// MARK: 1

let driving = {
    print("I'm driving in my car.")
}

driving()

func drive() {
    print("drive")
}
let driving3 = drive
driving3()


// MARK: 2

let drivingTo = { (place: String) in
    print("I'm going to \(place)")
}

drivingTo("London") // no need for parameter labels

// MARK: 3
let drivingText = { (place: String) -> String in
    return "I'm going to"
}

print(drivingText("London"))

// MARK: 4

func travel(action: () -> Void) {
    print("I'm ready!")
    action()
    print("I arrived!")
}

travel(action: driving)


// MARK: 5
// trailing closure
travel() {
    print("test2")
}
travel {
    print("test")
}
