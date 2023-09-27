
import SwiftUI
import AVKit

struct MatchCellButton: View {
    
    let match: Match
    @State var player: AVPlayer? = nil
    let onPress: (AVPlayer?) -> Void
    
    var body: some View {
        Button(action: {
            onPress(player)
        }) {
            MatchCell(match: match)
        }
        .buttonStyle(.plain)
        .onAppear {
            loadPlayer()
        }
        .onDisappear {
            player = nil
        }
    }
    
    func loadPlayer() {
        guard let page = match.wscGame?.primeStory?.pages.first else {
            return
        }
        guard let videoUrl = page.videoUrl else {
            return
        }
        guard let url = URL(string: videoUrl) else {
            return
        }
        player = AVPlayer(url:  url)
    }
    
}
