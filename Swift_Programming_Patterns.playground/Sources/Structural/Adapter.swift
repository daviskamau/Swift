import Foundation

protocol AuthService {

    func authFlow()
    
}

final class AppleAuthService: AuthService {

    func authFlow() {
        debugPrint(#function, Self.self)
    }
    
}

final class InstagramAuthService: AuthService {

    func authFlow() {
        debugPrint(#function, Self.self)
    }
    
}

final class AuthAdapter {
    
    func startInstagramAuth() {
        startAuth(with: InstagramAuthService.init())
    }
    
    func startAppleAuth() {
        startAuth(with: AppleAuthService.init())
    }
    
    func startAuth(with service: AuthService) {
        service.authFlow()
    }
    
}
