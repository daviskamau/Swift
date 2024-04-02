import Foundation

open class Observable<T> {
    
    public typealias CompletionHandler = ((T) -> Void)
    
    fileprivate var observers: [ObjectIdentifier : CompletionHandler] = [:]
    
    public var value: T {
        didSet {
            self.notifyObservers(self.value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        
        //
        removeAllObservers()
        //
        
        //
        debugPrint(#function, Self.self)
        //
        
    }
    
}

// MARK: - Public Methods
extension Observable {
    
    func addObserver(_ observer: AnyObject,
                     completion: @escaping CompletionHandler) {
        
        self.observers[ObjectIdentifier(observer)] = completion
        
    }
    
    func removeObserver(_ observer: AnyObject) {
        self.observers.removeValue(forKey: ObjectIdentifier(observer))
    }
    
}

// MARK: - Private Methods
fileprivate extension Observable {
    
    func notifyObservers(_ value: T) {
        self.observers.forEach({ $0.value(value) })
    }
    
    func removeAllObservers() {
        self.observers.removeAll()
    }
    
}

// ---------------------------------------------------------------------- //

enum AppearanceType {
    case dark
    case light
    case custom
}

final class Appearance {
    
    public var didChangeAppearanceObservable: Observable<AppearanceType>?
    
    func updateAppearance(with appearanceType: AppearanceType) {
        didChangeAppearanceObservable?.value = appearanceType
    }
    
}

final class BaseViewController: NSObject {
    
    fileprivate let appearance: Appearance
    
    init(appearance: Appearance) {
        self.appearance = appearance
        super.init()
        subscribe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        unsubscribe()
    }
    
}

// MARK: - Subscribe
fileprivate extension BaseViewController {
    
    func subscribe() {
        
        appearance
            .didChangeAppearanceObservable?
            .addObserver(self) { [weak self] newAppearanceType in
            
                self?.updateViews()
                
        }
        
    }
        
}

// MARK: - Unsubscribe
fileprivate extension BaseViewController {
    
    func unsubscribe() {
        
        appearance
            .didChangeAppearanceObservable?
            .removeObserver(self)
        
    }
        
}

// MARK: - Update Views
fileprivate extension BaseViewController {
    
    func updateViews() {
        updateViewBackgroundColor()
    }
    
    func updateViewBackgroundColor() {
        debugPrint(#function, Self.self)
    }
    
}
