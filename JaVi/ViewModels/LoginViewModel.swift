import SwiftUI
import FirebaseAuth

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var isLoggedIn = false

    func loginWithEmail() {
        errorMessage = nil
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    self?.isLoggedIn = false
                } else {
                    self?.isLoggedIn = true
                }
            }
        }
    }
}
