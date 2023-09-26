
import SwiftUI

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        Text(match.WSCGameId ?? "")
    }
}
