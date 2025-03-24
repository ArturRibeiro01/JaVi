//
//  InputFieldStyle.swift
//  JaVi
//
//  Created by Artur Mac on 23/03/25.
//

import SwiftUI

struct InputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .foregroundColor(Color.teal)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.teal, lineWidth: 2)
            )
            .foregroundColor(.white)
    }
}

extension View {
    func inputFieldStyle() -> some View {
        self.modifier(InputFieldStyle())
    }
}
