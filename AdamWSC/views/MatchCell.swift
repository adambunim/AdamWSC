
import SwiftUI

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        let name = match.wscGame?.name
        let lastPage: Page? = match.wscGame?.primeStory?.pages.last
        let homeScore = "\(lastPage?.homeScore ?? 0)"
        let awayScore = "\(lastPage?.awayScore ?? 0)"
        VStack {
            Text(name ?? "?")
                .font(.title)
            
            HStack {
                Text(homeScore)
                Text("-")
                Text(awayScore)
            }
            .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.top, 3)
        .padding(.bottom, 3)
        .padding([.leading, .trailing])
    }
    
    
}

#Preview {
    guard let url = Bundle.main.url(forResource: "example", withExtension: "json") else {
        return Text("no file")
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let match = try decoder.decode(Match.self, from: data)
        return MatchCell(match: match)
    }
    catch {
        return Text(error.localizedDescription)
    }
}
