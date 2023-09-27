
import SwiftUI

struct MatchCell: View {
    
    let match: Match
    
    var body: some View {
        Text(match.WSCGameId ?? "")
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
