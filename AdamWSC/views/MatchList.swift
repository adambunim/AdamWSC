
import SwiftUI
import AVKit

struct MatchList: View {
    
    let matches: [Match]
    @State var selectedMatch: Match? = nil
    @State var players: [String:AVPlayer] = [:]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<matches.count, id:\.self) { i in
                    let iter = matches[i]
                    MatchCellButton(match: iter) {
                        selectedMatch = iter
                    }
                }
                .sheet(item: $selectedMatch) { match in
                    MatchView(match: match, firstPlayer: nil)
                }
            }
        }
    }
    
}
