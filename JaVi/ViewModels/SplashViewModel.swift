import SwiftUI
import FirebaseAuth

final class SplashViewModel: ObservableObject {
    @Published var isAnimating = false
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var splashFinished = false

    func startAnimationAndCheckLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isAnimating = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.splashFinished = true
        }
    }
}
