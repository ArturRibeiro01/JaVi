//
//  HomeView.swift
//  JaVi
//
//  Created by Artur Mac on 23/03/25.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("HomeView")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Button("Logout") {
                    try? Auth.auth().signOut()
                    isUserLoggedIn = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
