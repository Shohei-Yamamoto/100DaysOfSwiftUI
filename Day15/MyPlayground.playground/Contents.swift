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

// MARK: polymorphism
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

// polymorphism: LiveAlbum is treated just as either Album or LiveAlbum

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
    
    if let liveAlbum = album as? LiveAlbum {
        print("Let's live with \(liveAlbum.name)")
    }
}


let number = 5
let text = String(number)
print(text)
