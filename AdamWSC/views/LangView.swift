
import SwiftUI

struct LangView: View {
    
    @AppStorage("lang") var lang: String = "en"
    
    var body: some View {
        if lang == "en" {
            Button(action: {
                lang = "he"
            }) {
                Text("A")
                    .accessibilityLabel("English")
            }
            .buttonStyle(.plain)
        }
        else {
            Button(action: {
                lang = "en"
            }) {
                Text("ע")
                    .accessibilityLabel("עברית")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    LangView()
}
