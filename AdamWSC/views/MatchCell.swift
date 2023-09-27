
import SwiftUI

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        Text(match.WSCGameId ?? "")
    }
}

#Preview {
    MatchCell(match: Match(WSCGameId: "Lazio@AC Milan-$2023-01-24"))
}
