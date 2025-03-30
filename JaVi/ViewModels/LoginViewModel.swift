import SwiftUI
import FirebaseAuth

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var isLoggedIn = false
    @Published var showingRegister = false
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false

    func loginWithEmail() {
        errorMessage = nil
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error {
                    self?.errorMessage = self?.mapFirebaseError(error)
                    self?.isLoggedIn = false
                } else {
                    self?.isUserLoggedIn = true
                }
            }
        }
    }

    private func mapFirebaseError(_ error: Error) -> String {
        guard let errCode = AuthErrorCode(_bridgedNSError: error as NSError) else {
            return error.localizedDescription
        }
        switch errCode.code {
        case .wrongPassword:
            return "Senha incorreta."
        case .invalidEmail:
            return "E-mail inválido."
        case .userNotFound:
            return "Usuário não encontrado."
        default:
            return error.localizedDescription
        }
    }
}
