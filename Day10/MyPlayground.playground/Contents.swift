import UIKit

// MARK: 1
// classes introduce a complex feature called inheritance.

// <!>classes and structs have **five** important differences.


// <1> classes never come with a memberwise initializer
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// MARK: 2

// <2> you can create a class based on an existing class - it inherits all the properties and methods of the original class, and can add its own on top. called class inheritance or subclassing

class Poodle: Dog {
    override init(name: String, breed: String) {
        // For safety reasons, Swift always makes you call super.init() from child classes. just in case the parent class does some impoertant work when it's created
        super.init(name: name, breed: "Poodle")
    }
}



// MARK: 3

class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle2: Dog2 {
    
}

let poppy2 = Poodle2()
poppy2.makeNoise()

class Poodle2_2: Dog2 {
    // Method overriding allows us to change the implementation of makeNoise() for the Poodle class.
    override func makeNoise() {
        print("Yip")
    }
}

let poppy2_2 = Poodle2_2()
poppy2_2.makeNoise()


// MARK: 4

// final keyword disallow other developers to have class to inherit from your final class.
final class FinalDog {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// MARK: 5

// <3> how they are copied. When you copy a struct, both the original and the copy are different things.
// when you copy a class, both the original and the copy point to the same thing, changeing one does change the other.

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)


struct Singer2 {
    var name = "Taylor Swift"
}

var singer2 = Singer2()
print(singer2.name)

var singerCopy2 = singer2
singerCopy2.name = "Justin Bieber"

print(singer2.name)



// MARK: 6

// <4> classes can have deinitializers

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// MARK: 7
// <5> the way they deal with constants. if you have a constant struct with a variable property, that property can't be changed because the struct itself is constant
// if you have a constant class with a variable property, that property can be changed. Because of this, classes don't need the mutating keyword with methods that change properties.


class Singer3 {
    // make the property constant if you want to stop change the value.
    var name = "Taylor Swift"
}

let taylor3 = Singer3()
taylor3.name = "Ed Sheeran"
print(taylor3.name)
