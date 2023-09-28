
import SwiftUI

struct LoadingList: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { _ in
                    LoadCell()
                }
            }
        }
    }
}

#Preview {
    LoadingList()
}
