//
//  SettingsRowView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 06/05/2024.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    let value: String
    
    init(imageName: String, title: String, tintColor: Color, value: String = "") {
            self.imageName = imageName
            self.title = title
            self.tintColor = tintColor
            self.value = value // Assign default value
        }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundStyle(tintColor)
                .frame(alignment: .leading)
                .padding(.leading)
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            Spacer()
            Text(value)
                .foregroundStyle(.gray)
                .padding(.trailing)
            
        }
        .frame(width: .infinity, height: 50) // Square shape for the tile
        .background(Color.gray.opacity(0.2)) // Background color for the tile
        .cornerRadius(10) // Rounded corners for the tile
        .padding(.horizontal, 10) // Horizontal padding for the tile
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray), value: "1.0.0")
}
