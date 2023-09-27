

import SwiftUI

struct ContentView: View {
    
    @State var result: Result<[Match],WSCError>? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text(.games)
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.2))
            
            switch result {
            case .success(let matches):
                ScrollView {
                    LazyVStack {
                        ForEach(matches, id: \.WSCGameId) {
                            MatchCell(match: $0)
                        }
                    }
                }
            case .failure:
                Text(.failed_to_load_matches)
            case .none:
                ProgressView()
            }
            Spacer()
        }
        .onAppear {
            MatchesLoader.load() { res in
                result = res
            }
        }
    }
    
}

