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
