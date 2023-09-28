
import SwiftUI

struct LangView: View {
    
    @AppStorage("lang") var lang: String = "en"
    
    var body: some View {
        if lang == "en" {
            Button(action: {
                lang = "he"
            }) {
                Text("ע")
            }
            .buttonStyle(.plain)
        }
        else {
            Button(action: {
                lang = "en"
            }) {
                Text("A")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    LangView()
}
