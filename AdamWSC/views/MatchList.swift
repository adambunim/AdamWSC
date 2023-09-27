
import SwiftUI
import AVKit

struct MatchList: View {
    
    let matches: [Match]
    @State var selectedMatch: Match? = nil
    @State var players: [String:AVPlayer] = [:]
    
    @State private var scrollID: Int?
    let bgColors: [Color] = [ .yellow, .blue, .orange, .indigo, .green ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<matches.count, id:\.self) { i in
                    let iter = matches[i]
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
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollID)
        .onChange(of: scrollID) { oldValue, newValue in
            print(newValue ?? "")
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
        players[id] = AVPlayer(url:  url)
    }
}
