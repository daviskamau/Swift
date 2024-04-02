import Foundation

// LIFO policy

enum StackError: Error {
    case underflow
}

struct Stack<Element> {
    
    fileprivate var array: [Element] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() throws -> Element {
        if (array.isEmpty) {
            throw StackError.underflow
        } else {
            return array.popLast()!
        }
    }
    
}
