
import SwiftUI
import AVKit

struct MatchList: View {
    
    let matches: [Match]
    @State var selectedMatch: Match? = nil
    @State var players: [String:AVPlayer] = [:]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(matches) { iter in
                    MatchCellButton(match: iter) {
                        selectedMatch = iter
                    }
                    .onAppear {
                        loadVideo(iter)
                    }
                    .onDisappear {
                        players[iter.id] = nil
                    }
                }
                .sheet(item: $selectedMatch) { match in
                    MatchView(match: match, firstPlayer: players[match.id])
                }
            }
        }
    }
    
    func loadVideo(_ match: Match) {
        let id = match.id
        if players[id] != nil {
            return
        }
        guard let first = match.wscGame?.primeStory?.pages.first else {
            return
        }
        guard let videoUrl = first.videoUrl else {
            return
        }
        guard let url = URL(string: videoUrl) else {
            return
        }
        print("loaded \(id)")
        players[id] = AVPlayer(url:  url)
    }
}
