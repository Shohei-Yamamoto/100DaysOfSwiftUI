import UIKit

// MARK: 1

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user")
    }
}

var user = User()
user.username

// MARK: 2



struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

let person = Person(name: "Shohei")
person.name


// MARK: 3

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
print("==")
ed.familyTree

// MARK: 4
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let edward = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)


// MARK: 5

struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }
}


let sho = Person3(id: "12345")
//sho.id // error
