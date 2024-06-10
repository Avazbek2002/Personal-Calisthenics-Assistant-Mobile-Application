//
//  ContentView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView {
                    Profile()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                    Skills()
                        .tabItem {
                            Label("Skills", systemImage: "figure.play")
                        }
                    Workout()
                        .tabItem {
                            Label("Workout", systemImage: "dumbbell")
                        }
                }
            } else {
                LoginView()
            }
        }
        
    }
}

//#Preview {
//    ContentView()
//}
