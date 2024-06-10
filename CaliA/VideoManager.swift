//
//  VideoManager.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 27/04/2024.
//

import Foundation
import AVKit
import AVFoundation

enum Query: String, CaseIterable {
    case push_up, pull_up, dip, handstand, human_flag, front_lever, back_lever
}

class VideoManager: ObservableObject {
    var link_to_video_database: URL?
    
    init(link_to_video_database: URL?) {
        self.link_to_video_database = link_to_video_database ?? URL(fileURLWithPath: "/Users/isroilov/Downloads/SampleVideos")
    }
    
    var videoURLs: [URL] {
        do {
            let videoURLs = try FileManager.default.contentsOfDirectory(at: link_to_video_database!, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            return videoURLs.filter { $0.pathExtension == "mp4" || $0.pathExtension == "mov" } // Filter only video files
        } catch {
            print("Error: \(error)")
            return []
        }
    }
    
    func getVideos() -> [Video] {
        var videos: [Video] = []
        do {
            var id = 1
            
            for url in videoURLs {
                let video = Video(id: id, playerItem: AVPlayerItem(url: url), replay: false)
                videos.append(video)
                id += 1
            }
        }
        
        return videos
    }
    
    
    func generatePreviewImage(videoURL: URL) -> UIImage {
        let asset = AVAsset(url: videoURL)
        let generator = AVAssetImageGenerator(asset: asset)
        var uiImage = UIImage()
        generator.appliesPreferredTrackTransform = true
        
        let time = CMTimeMake(value: 1, timescale: 1) // Get an image from 1 second into the video
        do {
            let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
            uiImage = UIImage(cgImage: cgImage)
            
        } catch {
            print("Error generating preview image: \(error.localizedDescription)")
        }
        return uiImage
    }
}

struct Video: Identifiable {
    var id: Int
    var playerItem: AVPlayerItem
    var replay: Bool
}


var videoPreview = Video(id: 1, playerItem: AVPlayerItem(url: URL(fileURLWithPath: "/Users/isroilov/Downloads/SampleVideos/video1.mov")), replay: false)
