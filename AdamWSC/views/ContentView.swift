

import SwiftUI

struct ContentView: View {
    
    @State var matches: [Match] = []
    
    var body: some View {
        List(matches) {
            MatchCell(match: $0)
        }
        .padding()
        .onAppear {
            matches = []
        }
    }
    
}

