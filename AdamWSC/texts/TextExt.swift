
import SwiftUI

extension Text {
    
    init(_ key: StringKey) {
        self.init(key.localized)
    }
    
}
