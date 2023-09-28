
import SwiftUI
import AVKit

struct MatchCellButton: View {
    
    let match: Match
    let onPress: () -> Void
    
    var body: some View {
        Button(action: {
            onPress()
        }) {
            MatchCell(match: match)
        }
        .buttonStyle(.plain)
    }
    
}
