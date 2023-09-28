
import SwiftUI

struct LoadingList: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<3) { _ in
                    LoadCell()
                }
            }
        }
    }
}

#Preview {
    LoadingList()
}
