
import SwiftUI

struct LangView: View {
    
    @AppStorage("lang") var lang: String = "en"
    
    var body: some View {
        if lang == "en" {
            Button(action: {
                lang = "he"
            }) {
                Text("A")
            }
            .buttonStyle(.plain)
        }
        else {
            Button(action: {
                lang = "en"
            }) {
                Text("ע")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    LangView()
}
