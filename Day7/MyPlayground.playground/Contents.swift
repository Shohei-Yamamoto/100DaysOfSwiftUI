import UIKit

// MARK: 1

func travel(action: (String) -> Void) {
    action("London")
}

travel { (place: String) in print("I'm going to \(place)") }

// MARK: 2

func travel2(action: (String) -> String) {
    let description = action("London")
    print(description)
}

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// MARK: 3
travel2 { place in "I'm going to \(place)"}
travel2 { "I'm going to \($0)"}


// MARK: 4
func travel3(action: (String, Int) -> String) {
    let description = action("London", 60)
    print(description)
}

travel3 {
    "I'm going to \($0) at \($1) miles per hour"
}

// Prefer not to parameter names like $0
travel3 { place, times in "I've been to \(place) \(times)times "
}

// MARK: 5
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel4()
result("Tokyo")

travel4()("Kyoto")

// MARK:6

func travel5() -> (String) -> Void {
    var counter = 1
    return {
        print("I'm going to \($0) \(counter) times")
        counter += 1
    }
}

let result2 = travel5()
result2("Tokyo")
result2("Tokyo")
result2("Tokyo")

let result3 = travel5()
result3("Kyoto")
result2("Tokyo")
