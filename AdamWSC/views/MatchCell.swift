
import SwiftUI
import AVKit

struct MatchCell: View {
    
    let match: Match
    let columns = [
        GridItem(.fixed(40)),
        GridItem(.flexible()),
        GridItem(.fixed(40))
    ]
    
    var body: some View {
        let lastPage: Page? = match.wscGame?.primeStory?.pages.last
        
        HStack {
            LazyVGrid(columns: columns, spacing: 20) {
                TeamLogo(team: match.teams?.home)
                TeamNameView(team: match.teams?.home)
                ScoreView(score: lastPage?.homeScore)
                TeamLogo(team: match.teams?.away)
                TeamNameView(team: match.teams?.away)
                ScoreView(score: lastPage?.awayScore)
            }
        }
        .frame(height: 200)
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

private struct TeamLogo: View {
    
    let team: Team?
    @State var opacity = 0.0
    
    var body: some View {
        ZStack {
            EmptyView()
                .frame(width: 30, height: 30)
            
            if let logo = team?.logo {
                AsyncImage(
                    url: URL(string: logo),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .offset(x: (1 - opacity) * -10)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation {
                                    opacity = 1.0
                                }
                            }
                    },
                    placeholder: {
                        EmptyView()
                    }
                )
            }
            else {
                Circle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(width: 30, height: 30)
            }
        }
        .frame(width: 30, height: 30)
    }
}

private struct TeamNameView: View {
    
    let team: Team?
    
    var body: some View {
        Text(team?.name ?? "?")
            .font(.title2)
    }
}

private struct ScoreView: View {
    
    let score: Int?
    
    var body: some View {
        Text("\(score ?? 0)")
            .font(.title2)
    }
}
