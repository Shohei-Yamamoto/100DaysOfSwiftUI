import UIKit

// MARK: Property

struct Person {
    var clothes: String {
        willSet {
            print("\(newValue) from \(clothes)" )
        }
        didSet {
            print("\(oldValue) to \(clothes)")
            
        }
    }
    
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()


var me = Person(clothes: "T-shirts", shoes: "sneakers")

me.clothes = "a"

// MARK: static properties and methods

struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

}

TaylorFan.favoriteSong


// MARK: Access Control

class TaylorFan2 {
    private var name: String?
}
