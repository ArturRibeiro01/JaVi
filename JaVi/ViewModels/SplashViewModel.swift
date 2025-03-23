import SwiftUI
import FirebaseAuth

final class SplashViewModel: ObservableObject {
    @Published var isAnimating = false
    @Published var isUserLoggedIn: Bool?

    func startAnimationAndCheckLogin() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let user = Auth.auth().currentUser
            self.isUserLoggedIn = user != nil
        }
    }
}
