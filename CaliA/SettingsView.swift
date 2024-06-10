//
//  AccDetailsView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 06/05/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("General")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.leading)
            SettingsRowView(imageName: "gear",
                            title: "Version",
                            tintColor: Color(.systemGray),
                            value: "1.0.0")
            
            Spacer()
            Text("Account")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.leading)
            
            VStack {
                Button {
                    
                } label : {
                    SettingsRowView(imageName: "envelope",
                                    title: "Email",
                                    tintColor: Color(.gray),
                                    value: "name@exmaple.com")
                }
                
                Button {
                    
                } label : {
                    SettingsRowView(imageName: "person",
                                    title: "Full Name",
                                    tintColor: Color(.gray),
                                    value: viewModel.currentUser!.firstName + " " + viewModel.currentUser!.lastName)
                }
                
                Button {
                    Task {
                        viewModel.signOut()
                    }
                } label: {
                    SettingsRowView(imageName:"arrow.left.circle.fill",
                                    title: "Sign Out",
                                    tintColor: Color(.red),
                                    value: ""
                    )
                }
                
                Button {
                    
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill",
                                    title: "Delete Account",
                                    tintColor: Color(.red),
                                    value: ""
                    )
                }
            }
        }
    }
}


#Preview {
    SettingsView()
}
