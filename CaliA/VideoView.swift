//
//  VideoView.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 27/04/2024.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .onAppear {
                // Access the AVAsset from AVPlayerItem
                if let asset = video.playerItem.asset as? AVURLAsset {
                    // Access the URL from AVURLAsset
                    let url = asset.url
                    // Create a new AVPlayerItem using the URL
                    let playerItem = AVPlayerItem(url: url)
                    // Assign the new AVPlayerItem to the AVPlayer
                    player.replaceCurrentItem(with: playerItem)
                    player.play()
                } else {
                    print("AVPlayerItem does not contain a URL")
                }
            }
    }
}

//struct MediaPlayer: View {
//    // URL of the directory containing videos
//    let videoDirectoryURL: URL?
//    
//    // List of video URLs obtained from the directory
//    var videoURLs: [URL] {
//        do {
//            let videoURLs = try FileManager.default.contentsOfDirectory(at: videoDirectoryURL!, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
//            return videoURLs.filter { $0.pathExtension == "mp4" || $0.pathExtension == "mov" } // Filter only video files
//        } catch {
//            print("Error: \(error)")
//            return []
//        }
//    }
//    
////    var body: some View {
////        ScrollView {
////            VStack(spacing: 0) {
////                ForEach(videoURLs, id: \.self) { videoURL in
////                    Video(videoURL: videoURL)
////                        .frame(height: 200) // Adjust size as needed
////                        .padding()
////                }
////            }
////        }
////    }
//}


struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: videoPreview)
    }
}
