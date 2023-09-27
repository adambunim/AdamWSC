
import SwiftUI

struct MatchView: View {
    
    let match: Match
    
    var body: some View {
        let homeName = match.wscGame?.homeTeamName ?? "?"
        let awayName = match.wscGame?.awayTeamName ?? "?"
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("\(homeName) - \(awayName)")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.2))
            
            if let pages = match.wscGame?.primeStory?.pages {
                TabView {
                    ForEach(pages) {
                        PageView(page: $0)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
            else {
                Text(.nothing_to_show)
            }
            
            Spacer()
        }
    }
}

#Preview {
    guard let match = ExampleLoader.load() else {
        return Text("failed to load")
    }
    return MatchView(match: match)
}