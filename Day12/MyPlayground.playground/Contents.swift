import UIKit

// MARK: 1
// optional

var age: Int? = nil
age = 38

// MARK: 2
var name: String? = nil


if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("missing")
}

// MARK: 3
// guard let: rest of your function is the happy path
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("missing name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}

greet(nil)

// MARK: 4

let str = "5"
let num = Int(str)
let num2 = Int(str)!

type(of: num)
type(of: num2)


// MARK: 5

// implicitly unwrapped optional
// you can yse them as if they weren't optional at all.

var num3: Int! = nil
// implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it.
print(num3)

//num3 + num3 // crash!

num3 = 3

num3 + num3

// MARK: 6

// nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


// MARK: 7
// optional chaining
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

// MARK: 8
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}


if let result = try? checkPassword("a") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit") // this code will crash when you input "password"
print("OK!")

// MARK: 9
// failable initilizer

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// MARK: 10
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

print(type(of: pets.self)) // Array<Animal>

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
