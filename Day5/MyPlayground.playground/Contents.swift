import UIKit


// MARK: 1
func printHelp() {
    let message = """
    Welcome to MyApp!
    
    Run this app inside a directory
    """
    
    print(message)
}

printHelp()

// MARK: 2
func square(number: Int) {
    print(number * number)
}

square(number: 8)


// MARK: 3
func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)

// tuple is useful if you need to return multiple values


// MARK: 4
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "Taylor")

// MARK: 5
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Talor")

// generally, it's better to give your parameters external names to avoid confusion
// ex: setAlarm(5) does it set an alarm for 5 o'clock or set an alarm for five hours from now?

// MARK: 6
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}


// MARK: 7
func square(numbers: Int...) {
    // numbers is Array<Int>
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1,2,3,4)

// MARK: 8

// we need to define an enum that describes the errors
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if  password == "password" {
        throw PasswordError.obvious
    }
    return true
}

// MARK: 9
do {
    try checkPassword("password")
    print("good!")
} catch {
    print("You can't use that password.")
}

// MARK: 10

// if you want to change parameter variables in functions, use inout
func doubleInPlace(number: inout Int) {
    number * 2
}

var myNum = 10
doubleInPlace(number: &myNum)

