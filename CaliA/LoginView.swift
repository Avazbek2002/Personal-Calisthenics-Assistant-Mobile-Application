//
//  LoginView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 06/05/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // Logo
                Image("CaliABrightMode")
                    .resizable()
                    .scaledToFit()
                    .padding([.top, .horizontal])
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top, -60)
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("Sign in")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.black))
                .cornerRadius(10)
                
                // sign in button
                Spacer()
                // sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account? ")
                        Text("Sign Up")
                            .fontWeight(.bold)
                            
                    }
                    .font(.system(size:14))
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
