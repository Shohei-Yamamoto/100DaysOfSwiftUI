import UIKit

// https://qiita.com/shoheiyokoyama/items/31eca0d4b27bc9608eb8

struct Queue<Element> {
    private var elements = [Element]()
    
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {return nil}
        return elements.remove(at: 0)
    }
}

var intQueue = Queue<Int>()
intQueue.enqueue(newElement: 1)
intQueue.enqueue(newElement: 2)
intQueue.enqueue(newElement: 3)
intQueue.dequeue()
intQueue.dequeue()


extension Queue {
    func peek() -> Element? {
        return elements.first
    }
}

intQueue.peek()


// protocolのgenerics
protocol Container {
    associatedtype ItemType
    
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    var items = [Int]()
    
//    typealias ItemType = Int // いらない？

    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}
var intStack = IntStack()
intStack.append(2)
intStack.append(3)
intStack.append(4)

intStack.count//3
intStack[2]//4


func swapTwoInts<T: Comparable>(_ a: inout T, _ b:inout T) {
    let temploraryA = a
    print(a < b)
    a = b
    b = temploraryA
}
// : Comparable is type constarints

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

someInt
anotherInt


func allItemsMatch<C1: Container, C2: Container>(someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

//
//extension CollectionType where Self.Generator.Element: Comparable {
//    func largestValue() -> Generator.Element? {
//        guard var largestValue = first else { return nil }
//
//        for item in self {
//
//            if item > largestValue {
//                largestValue = item
//            }
//        }
//        return largestValue
//    }
//}

protocol TestApp {
    associatedtype AppType
    var type: AppType {get}
    
}

protocol AApp {
    var test: String { get }

}

protocol BApp {
    var test: String { get }

}

struct A: TestApp, AApp {
    typealias AppType = AApp
    
    var test: String {
        return "A"
    }
    
    var type: AppType {
        return self
    }
}

struct B: TestApp, BApp {
    typealias AppType = BApp
    
    var test: String {
        return "B"
    }
    
    var type: AppType {
        return self
    }
}

extension TestApp where AppType == AApp {
    func name() -> String {
        return self.type.test + "AAA"
    }
}

extension TestApp where AppType == BApp {
    func name() -> String {
        return self.type.test + "BBBA"
    }
}

let a = A()
a.name()

let b = B()
b.name()
