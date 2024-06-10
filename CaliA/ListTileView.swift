import SwiftUI

struct ListTileView: View {
    var imageName: String
        var title: String
        var subtitle: String
        
        var body: some View {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10) // Rounded corners for the image
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10) // Padding between image and title
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 70) // Square shape for the tile
            .background(Color.gray.opacity(0.2)) // Background color for the tile
            .cornerRadius(10) // Rounded corners for the tile
            .padding(.vertical, 5) // Vertical padding for the tile
            .padding(.horizontal, 10) // Horizontal padding for the tile
        }
}
