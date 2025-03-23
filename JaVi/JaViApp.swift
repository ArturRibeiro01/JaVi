//
//  JaViApp.swift
//  JaVi
//
//  Created by Artur Mac on 23/03/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct JaViApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
