import UIKit

// MARK: 1
let firstScore = 12
let secondScore = 4
let total = firstScore + secondScore
let diffference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore



// MARK: 2
// operator overloading, an operator depends on the values you use it with.

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// adding an integer to a string doesn't make any sense, swift is type-safe language

// MARK: 3

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// MARK: 4

firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore

"Taylor" <= "Swift"


// MARK: 5
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if  firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else {
    print("Regular cards")
}

// MARK: 6
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

// MARK: 7
// ternary Operator

print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // if you want execution to continue on to the next case
default:
    print("Enjoy your day!")
}

// MARK: 8
// range operator

let score2 = 85

switch score2 {
case 0..<50:
    print("You failed badly.")
case 50..<80:
    print("You did OK.")
default:
    print("You did great!")
}
