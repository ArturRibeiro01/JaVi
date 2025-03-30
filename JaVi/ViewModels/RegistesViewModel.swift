//
//  RegistesViewModel.swift
//  JaVi
//
//  Created by Artur Mac on 30/03/25.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?

    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false

    func register() {
        errorMessage = nil

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = self?.mapFirebaseError(error)
                } else {
                    self?.isUserLoggedIn = true
                }
            }
        }
    }

    private func mapFirebaseError(_ error: Error) -> String {
        let errCode = AuthErrorCode(_bridgedNSError: error as NSError)

        switch errCode?.code {
        case .emailAlreadyInUse:
            return "Este e-mail já está em uso."
        case .weakPassword:
            return "Senha muito fraca. Use pelo menos 6 caracteres."
        default:
            return error.localizedDescription
        }
    }
}
