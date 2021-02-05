import UIKit

// MARK: Functions

func favoriteAlbum(name: String) {
    print("My favorit is \(name)")
}

favoriteAlbum(name: "Fearless")

// MARK: Optional

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    print(haterStatus)
    type(of: haterStatus)
}


// MARK: Optional Chaining
func albuReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default:
        return nil
    }
}

let album = albuReleased(year: 2006)


let album2 = albuReleased(year: 10) ?? "no album"


// MARK: enum
enum WeatherType {
    case sun, cloud, rain, wind(speed: Int), snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .wind(let speed) where speed < 10:
        return "meer"
    default:
        return nil
    }
}

getHaterStatus(weather: WeatherType.cloud)
getHaterStatus(weather: WeatherType.wind(speed: 100))

getHaterStatus(weather: WeatherType.wind(speed: 1))


// MARK: struct
struct Person {
    var clothes: String
    var shoes: String
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)


// MARK: class
class Singer {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    @objc func sing() {
        print("La la la la")
    }
}

var taylorswift = Singer(name: "Taylor", age: 25)
taylorswift.name
taylorswift.age
taylorswift.sing()

