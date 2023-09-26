

import SwiftUI

struct ContentView: View {
    
    @State var result: Result<[Match],WSCError>? = nil
    
    var body: some View {
        VStack {
            switch result {
            case .success(let matches):
                List(matches) {
                    MatchCell(match: $0)
                }
            case .failure:
                Text(.failed_to_load_matches)
            case .none:
                ProgressView()
            }
        }
        .padding()
        .onAppear {
            result = MatchesLoader.load()
        }
    }
    
}

