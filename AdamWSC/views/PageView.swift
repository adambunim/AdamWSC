
import SwiftUI
import AVKit

struct PageView: View {
    
    let page: Page
    @State var player: AVPlayer? = nil
    
    var body: some View {
        VStack {
            if let player {
                VideoPlayer(player: player)
            }
            else {
                Text(.failed_to_load)
            }
        }
        .onAppear {
            guard let videoUrl = page.videoUrl else {
                return
            }
            guard let url = URL(string: videoUrl) else {
                return
            }
            player = AVPlayer(url:  url)
            player?.play()
        }
        .onDisappear {
            player?.pause()
        }
    }
}

#Preview {
    let page = Page(
        duration: 16315,
        paggeId: "1CFAE47EB34BF02C56DF29F7E018068A43C28859",
        videoUrl: "https://editorsprodeus2.prod-cdn.clipro.tv/editor/b4d7e027-d08f-4954-ad04-a6d9987cf75e.mp4",
        title: "Kick Off by AlmerÃ­a ",
        awayScore: 0,
        eventType: "PlayByPlay",
        gameClock: "00:00",
        homeScore: 0,
        rating: 1,
        period: "1",
        actionType: "KickOff"
    )
    return PageView(page: page)
}
