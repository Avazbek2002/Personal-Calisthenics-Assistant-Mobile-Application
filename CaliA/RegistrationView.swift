//
//  RegistrationView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 06/05/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var comfirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("CaliABrightMode")
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                
                InputView(text: $firstName,
                          title: "First Name",
                          placeholder: "Enter your first name")
                
                InputView(text: $lastName,
                          title: "Last Name",
                          placeholder: "Enter your last name")
                
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $comfirmPassword,
                          title: "Confirm Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .padding(.top, -60)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   firstName: firstName,
                                                   lastName: lastName)
                }
            } label: {
                HStack {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                    
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.black))
            .cornerRadius(10)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                        
                }
                .font(.system(size:14))
                .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
