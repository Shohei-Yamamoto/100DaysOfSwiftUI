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
