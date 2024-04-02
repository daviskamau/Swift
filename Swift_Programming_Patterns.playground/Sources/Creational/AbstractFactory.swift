import Foundation

protocol Storage {
    func create()
    func read()
    func update()
    func delete()
}

protocol MemoryStorage: Storage {
    
}

protocol DiskStorage: Storage {
    
}

protocol CoreDataStorage: Storage {
    
}

final class ConcreteMemoryStorage: MemoryStorage {
    
    init() {
        debugPrint(#function, Self.self)
    }
    
    func create() {
        
    }
    
    func read() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
}

final class ConcreteDiskStorage: MemoryStorage {
    
    init() {
        debugPrint(#function, Self.self)
    }
    
    func create() {
        
    }
    
    func read() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
}

final class ConcreteCoreDataStorage: MemoryStorage {
    
    init() {
        debugPrint(#function, Self.self)
    }
    
    func create() {
        
    }
    
    func read() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
}

let coreDataStorage: Storage = ConcreteCoreDataStorage.init()
let memoryStorage: Storage = ConcreteMemoryStorage.init()
let diskStorage: Storage = ConcreteDiskStorage.init()
