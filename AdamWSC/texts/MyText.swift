
import SwiftUI

struct MyText: View {
    
    @AppStorage("lang") var lang: String = "en"
    
    let key: StringKey
    
    init(_ key: StringKey) {
        self.key = key
    }
    
    var body: some View {
        Text(key.rawValue.localized(lang))
    }
}

#Preview {
    MyText(.games)
}
