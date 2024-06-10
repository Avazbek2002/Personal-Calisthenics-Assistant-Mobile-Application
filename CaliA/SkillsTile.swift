//
//  SkillsTile.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 26/04/2024.
//

import SwiftUI

struct SkillsTile: View {
    var imageName: String
    var imageWidth: Float?
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageWidth != nil ? CGFloat(Float(imageWidth!) ) : 70, height: 80)
                .cornerRadius(10) // Rounded corners for the image
                .padding()
            Spacer()
            VStack(alignment: .trailing) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.trailing)
            .frame(alignment: .trailing)// Padding between image and title
            
            //Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100) // Square shape for the tile
        .background(Color.gray.opacity(0.2)) // Background color for the tile
        .cornerRadius(10) // Rounded corners for the tile
        .padding(.vertical, 5) // Vertical padding for the tile
        .padding(.horizontal, 10) // Horizontal padding for the tile
    }
}

#Preview {
    SkillsTile(imageName: "back_lever", imageWidth: 120, title: "Human Flag", subtitle: "Advanced")
}
