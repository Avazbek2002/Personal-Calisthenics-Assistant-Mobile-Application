//
//  CaliAApp.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 29/02/2024.
//

import SwiftUI
import Firebase

@main
struct CaliAApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
