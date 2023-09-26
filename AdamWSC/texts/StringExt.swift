
import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

extension StringKey {
    
    var localized: String {
        return self.rawValue.localized
    }
    
}
