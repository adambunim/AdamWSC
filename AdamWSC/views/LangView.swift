
import SwiftUI

struct LangView: View {
    
    @State var lang: String = "he"
    
    var body: some View {
        Button(action: {
            lang = "he"
        }) {
            Text("ע")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LangView()
}
