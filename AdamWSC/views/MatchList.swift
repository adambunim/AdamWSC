
import SwiftUI

struct MatchList: View {
    
    let matches: [Match]
    @State var selectedMatch: Match? = nil
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(matches) { iter in
                    MatchCellButton(match: iter, onPress: {
                        selectedMatch = iter
                    })
                }
                .sheet(item: $selectedMatch) { match in
                    MatchView(match: match)
                }
            }
        }
    }
}
