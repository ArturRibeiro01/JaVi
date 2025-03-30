//
//  RegisterView.swift
//  JaVi
//
//  Created by Artur Mac on 30/03/25.
//

import SwiftUI

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Criar conta")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

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

                Button("Cadastrar") {
                    viewModel.register()
                }
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

            Button("Voltar") {
                dismiss()
            }
            .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    RegisterView()
}
