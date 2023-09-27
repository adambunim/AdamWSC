
import SwiftUI
import AVKit

struct PageView: View {
    
    let page: Page
    let player: AVPlayer?
    
    var body: some View {
        if let player {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
        }
        else {
            ProgressView()
        }
    }
}
