
import SwiftUI

struct MatchView: View {
    
    let match: Match
    
    var body: some View {
        let title  = match.wscGame?.homeTeamName
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text(.games)
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.2))
            
            if let pages = match.wscGame?.primeStory?.pages {
                ScrollView {
                    LazyVStack {
                        ForEach(pages) {
                            PageView(page: $0)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    guard let match = ExampleLoader.load() else {
        return Text("failed to load")
    }
    return MatchView(match: match)
}
