import Foundation

// FIFO policy

enum QueueError: Error {
    case underflow
}

struct Queue<Element> {
    
    fileprivate var array: [Element] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    mutating func dequeue() throws -> Element {
        if (array.isEmpty) {
            throw QueueError.underflow
        } else {
            return array.removeFirst()
        }
    }
    
}
