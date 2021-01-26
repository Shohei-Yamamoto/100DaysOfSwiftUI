import UIKit

// MARK: 1

let count = 1...10

for number in count {
    print("Number is  \(number)")
}


let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}


// MARK: 2

var number = 1

while number <= 20 {
    print(number)
    number += 1
}


// MARK: 3
number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

repeat {
    print("test")
} while false

//while false {
//    print("text")
//}

// MARK:4
var countDown = 10

while countDown >= 0 {
    print(countDown)
    if countDown <= 4 {
        break
    }
    countDown -= 1
}

// MARK:5

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            break outerLoop
        }
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            break
        }
    }
}

// MARK: 6

for i in 1...10 {
    if i%2 == 1 {
        continue
    }
    print(i)
}

// MARK: 7
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
