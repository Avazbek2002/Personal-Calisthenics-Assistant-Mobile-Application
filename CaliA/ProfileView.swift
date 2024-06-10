//
//  Profile.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 29/02/2024.
//

import SwiftUI
import AVKit

struct Profile: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var currentTab = "Media"
    @Namespace var animation
    @EnvironmentObject var viewModel: AuthViewModel
    var videoManager = VideoManager(link_to_video_database: URL(fileURLWithPath: "/Users/isroilov/Downloads/SampleVideos"))
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 80)]
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                ScrollView {
                    ZStack {
                        Image("CaliRama")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        LinearGradient(gradient: Gradient(colors:
                                                            [.clear, Color(.systemBackground)]), startPoint: .top,
                                       endPoint: .bottom)
                        .overlay(alignment: .bottom) {
                            VStack(alignment: .leading)
                            {
                                HStack {
                                    Text(user.initials)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                        .frame(width:72, height: 72)
                                        .background(Color(.systemGray))
                                        .clipShape(Circle())
                                    
                                    Spacer()
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Edit Profile")
                                            .foregroundColor(.blue)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(
                                                Capsule()
                                                    .stroke(Color.blue, lineWidth: 2)
                                            )
                                    })
                                }
                                .padding(.horizontal)
                                
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.horizontal)
                        }
                    }
                    
                    VStack (alignment: .leading, spacing: 8) {
                        Text(user.firstName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        HStack (spacing: 2) {
                            Image("instagram")
                            
                            if user.ighandle == "" {
                                Text("None")
                                    .foregroundColor(.gray)
                            } else {
                                Text("@" + user.ighandle)
                            }
                                
                        }
                        
                        Text("CaliRama is professional calisthenics athlete. He is from Dagistan. He has an instagram account followed by millions of people.")
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(spacing: 0) {
                        HStack(alignment: .center, spacing: 0) {
                            TabButton(title: "Media", currentTab: $currentTab, animation: animation)
                            
//                            TabButton(title: "Bio", currentTab: $currentTab, animation: animation)
                            
                            TabButton(title: "Settings", currentTab: $currentTab, animation: animation)
                        }
                        
                        Divider()
                        
                    }
                    .padding(.top, 10)
                    
                    if currentTab == "Media" {
                        let videos = videoManager.getVideos()
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(videos, id:\.id) { video in
                                
                                NavigationLink(destination: VideoView(video: video), label: {
                                    VideoCard(video: video)
                                })
                            }
                        }
                    }
                    
                    else if currentTab == "Bio" {
                        
                    }
                    
                    else if currentTab == "Settings" {
                        
                        SettingsView()
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
        } else {
            
        }
    }
}

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}

struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation{
                currentTab = title
            }
        }, label: {
            LazyVStack(spacing: 12) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .blue : .gray)
                    .padding(.horizontal)
                
                if currentTab == title {
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.5)
                }
            }
        })
    }
}

struct VideoPlayerView: View {
    let videoURL: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .onAppear {
                // Automatically start playback when the view appears
                self.play()
            }
            .onDisappear {
                // Pause playback when the view disappears
                self.pause()
            }
    }
    
    private func play() {
        // Play the video
        NotificationCenter.default.post(name: .AVPlayerItemNewAccessLogEntry, object: nil)
    }
    
    private func pause() {
        // Pause the video
        NotificationCenter.default.post(name: .AVPlayerItemNewAccessLogEntry, object: nil)
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
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(videoURLs, id: \.self) { videoURL in
//                    VideoPlayerView(videoURL: videoURL)
//                        .frame(height: 200) // Adjust size as needed
//                        .padding()
//                }
//            }
//        }
//    }
//}


#Preview {
    Profile()
}
