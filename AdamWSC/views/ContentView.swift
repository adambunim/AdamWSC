

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
                MatchList(matches: matches)
            case .failure:
                Text(.failed_to_load)
            case .none:
                ScrollView {
                    LazyVStack {
                        ForEach(0..<3) { _ in 
                            LoadCell()
                        }
                    }
                }
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

