//import SwiftUI
//import AVKit
//
//struct CarouselView: View {
//    
//    @State var data = [
//        Video(id: 1, playerItem: AVPlayerItem(url: Bundle.main.url(forResource: "video1", withExtension: "mov")!), replay: false),
//        Video(id: 2, playerItem: AVPlayerItem(url: Bundle.main.url(forResource: "video2", withExtension: "mov")!), replay: false),
//        Video(id: 3, playerItem: AVPlayerItem(url: Bundle.main.url(forResource: "video3", withExtension: "mov")!), replay: false),
//        Video(id: 4, playerItem: AVPlayerItem(url: Bundle.main.url(forResource: "video4", withExtension: "mov")!), replay: false),
//        Video(id: 5, playerItem: AVPlayerItem(url: Bundle.main.url(forResource: "video5", withExtension: "mov")!), replay: false)
//    ]
//    var height: Float
//    
//    var body: some View {
//        ZStack{
//            PlayerScrollView(data: self.$data, height: height)
//        }
//    }
//}
//
//struct PlayerView: View {
//    @Binding var data: [Video]
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            ForEach(self.data){ video in
//                Player(playerItem: video.playerItem)
//                    .frame(width: UIScreen.main.bounds.width)
//            }
//        }
//        .onAppear{
//            // Start playing the first video when the view appears
//            if let firstPlayer = self.data.first?.playerItem {
//                let player = AVPlayer(playerItem: firstPlayer)
//                player.play()
//            }
//        }
//    }
//}
//
//struct Player: UIViewControllerRepresentable {
//    var playerItem: AVPlayerItem
//    
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let player = AVPlayer(playerItem: playerItem)
//        let view = AVPlayerViewController()
//        view.player = player
//        view.showsPlaybackControls = false
//        view.videoGravity = .resizeAspectFill
//        return view
//    }
//    
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//        
//    }
//}
//

//
//struct PlayerScrollView: UIViewRepresentable {
//    @Binding var data: [Video]
//    var height: Float
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent1: self)
//    }
//    
//    func makeUIView(context: Context) -> UIScrollView {
//        let view = UIScrollView()
//        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
//        
//        // Calculate the height of the childView based on the number of videos and the specified height
//        let childHeight = CGFloat(height * Float(data.count))
//        
//        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: childHeight)
//        
//        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: childHeight)
//        
//        view.addSubview(childView.view)
//        view.showsVerticalScrollIndicator = false
//        view.showsHorizontalScrollIndicator = false
//        
//        view.contentInsetAdjustmentBehavior = .never
//        
//        view.isPagingEnabled = true
//        view.delegate = context.coordinator
//        
//        return view
//    }
//     
//    func updateUIView(_ uiView: UIScrollView, context: Context) {
//        // Update the view if needed
//    }
//}
//
//
//class Coordinator : NSObject, UIScrollViewDelegate {
//    
//    var parent: PlayerScrollView
//    
//    init(parent1: PlayerScrollView) {
//        parent = parent1
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let index = Int(Float(scrollView.contentOffset.y) / parent.height)
//        
//        print(index)
//    }
//}
//
//
//#Preview {
//    
//    CarouselView(height: 400)
//}
//
//
//// 14:18
