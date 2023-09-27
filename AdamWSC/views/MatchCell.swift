
import SwiftUI

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        let lastPage: Page? = match.wscGame?.primeStory?.pages.last
        ZStack {
            if let background = match.league?.logo {
                AsyncImage(
                    url: URL(string: background),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .opacity(0.1)
                    },
                    placeholder: {
                        EmptyView()
                    }
                )
            }
            
            HStack {
                TeamScoreView(
                    logo: match.teams?.home?.logo,
                    name: match.wscGame?.homeTeamName,
                    score: lastPage?.homeScore)
                Spacer()
                Text("-")
                Spacer()
                TeamScoreView(
                    logo: match.teams?.away?.logo,
                    name: match.wscGame?.awayTeamName,
                    score: lastPage?.awayScore)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(.gray.opacity(0.2))
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
        VStack {
            if let logo {
                AsyncImage(
                    url: URL(string: logo),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    },
                    placeholder: {
                        EmptyView()
                    })
            }
            Text(name ?? "?")
                .font(.title2)
            Text("\(score ?? 0)")
                .font(.headline)
        }
    }
}
