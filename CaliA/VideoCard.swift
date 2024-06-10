//
//  VideoCard.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 27/04/2024.
//

import SwiftUI
import AVFoundation

struct VideoCard: View {
    var video: Video
    var videoMng = VideoManager(link_to_video_database: URL(string: ""))
    var uiimage = UIImage()
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading, content: {
                if let asset = video.playerItem.asset as? AVURLAsset {
                    // Access the URL from AVURLAsset
                    let url = asset.url
                    // Create a new AVPlayerItem using the URL
                    let uiimage = videoMng.generatePreviewImage(videoURL: url)
                    
                    Image(uiImage: uiimage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        //.frame(width: 160, height: 250)
                        .frame(width: UIScreen.main.bounds.size.width)
                } else {
                    Text("AVPlayerItem does not contain a URL")
                }
                
//                VStack(alignment: .leading, content: {
//                    Text("32 sec")
//                        .font(.caption).bold()
//
//                    Text("By XYZ")
//                        .font(.caption).bold()
//                        .multilineTextAlignment(.leading)
//                })
//                .foregroundColor(.white)
//                .shadow(radius: 20)
//                .padding()
            })
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
    }
}

#Preview {
    VideoCard(video: videoPreview)
}
