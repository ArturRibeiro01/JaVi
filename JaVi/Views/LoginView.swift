//
//  LoginView.swift
//  JaVi
//
//  Created by Artur Mac on 23/03/25.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            VStack(spacing: 8) {
                Text("Já ví")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Login")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }

            VStack(spacing: 16) {
                TextField("E-mail", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .inputFieldStyle()

                SecureField("Senha", text: $viewModel.password)
                    .inputFieldStyle()

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }

                Button(action: {
                    viewModel.loginWithEmail()
                }) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("Entrar")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.teal, lineWidth: 2)
                            )
                    }
                }
                Button(action: {
                    // @TO-DO - ação de cadastro no futuro
                }) {
                    Text("Ainda não tem conta? Cadastre-se")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.top, 8)
            }

            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))

                Text("ou")
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))
            }
            .padding(.vertical, 12)

            VStack(spacing: 16) {
               
                socialLoginButton(
                    label: "Iniciar com Apple",
                    imageName: "apple-icon",
                    background: Color.black,
                    foreground: Color.white,
                    border: true,
                    action: {}
                ).disabled(true)

                socialLoginButton(
                    label: "Iniciar com Google",
                    imageName: "google-icon",
                    background: Color.black,
                    foreground: Color.white,
                    border: true,
                    action: {
                        GoogleAuthService.shared.signInWithGoogle { result in
                            switch result {
                            case .success:
                                isUserLoggedIn = true
                            case .failure(let error):
                                print("Erro ao logar com Google: \(error.localizedDescription)")
                            }
                        }
                    }
                )
                
                socialLoginButton(
                    label: "Iniciar com Microsoft",
                    imageName: "windows-icon",
                    background: Color.black,
                    foreground: Color.white,
                    border: true,
                    action: {}
                ).disabled(true)
            }
            .padding(.top, 8)

            Spacer()
        }
        .padding()
        .background(Color.black)
    }

    func socialLoginButton(label: String,
                           systemImage: String? = nil,
                           imageName: String? = nil,
                           background: Color,
                           foreground: Color,
                           border: Bool = false,
                           action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                if let systemImage = systemImage {
                    Image(systemName: systemImage)
                    
                }
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                Text(label)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(background)
            .foregroundColor(foreground)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.teal, lineWidth: 2)
            )
        }
    }
}

#Preview {
    LoginView()
}
