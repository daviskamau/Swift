import Foundation

enum SyncState {
    case initialization
    case start
    case inProgress(progress: Float)
    case finish
}

protocol SyncManagerInterface {
    
    var isRunning: Bool { get }
    var currentState: SyncState { get }
    
    func start()
    func cancel()
    
}

final class SyncManager: SyncManagerInterface {
    
    public var isRunning: Bool {
        
        switch currentState {
            
        case .initialization,
                .finish:
            
            return false
            
            
        case .start,
                .inProgress:
            
            return true
            
        }
        
    }
    
    public var currentState: SyncState
    
    init() {
        self.currentState = .initialization
    }
    
}

// MARK: - Public Methods
extension SyncManager {
    
    func start() {
        
        // Update Current Step
        //
        self.currentState = .start
        //
        
        // Code For Synchronization
        // ...
        // ...
        
        // Update Current Step
        //
        self.currentState = .inProgress(progress: .zero)
        //
        
    }
    
    func cancel() {
        
        // Update Current Step
        //
        self.currentState = .finish
        //
        
    }
    
}
