
import SwiftUI
import AVKit

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        let lastPage: Page? = match.wscGame?.primeStory?.pages.last
        HStack {
            VStack(alignment: .leading) {
                TeamScoreView(
                    logo: match.teams?.home?.logo,
                    name: match.wscGame?.homeTeamName,
                    score: lastPage?.homeScore)
                TeamScoreView(
                    logo: match.teams?.away?.logo,
                    name: match.wscGame?.awayTeamName,
                    score: lastPage?.awayScore)
                Spacer()
            }
            Spacer()
        }
        .environment(\.layoutDirection, .leftToRight)
        .padding()
        .background(.blue.opacity(0.1))
        .cornerRadius(20)
        .padding(.top, 3)
        .padding(.bottom, 3)
        .padding([.leading, .trailing])
    }
    
}

#Preview {
    guard let match = ExampleLoader.load() else {
        return Text("failed to load")
    }
    return MatchCell(match: match)
}

private struct TeamScoreView: View {
    
    let logo: String?
    let name: String?
    let score: Int?
    
    var body: some View {
        HStack {
            if let logo {
                AsyncImage(
                    url: URL(string: logo),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 30, maxHeight: 30)
                            .clipShape(Circle())
                    },
                    placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 30, height: 30)
                    }
                )
            }
            Text(name ?? "?")
            Text("\(score ?? 0)")
        }
        .font(.title2)
    }
}
