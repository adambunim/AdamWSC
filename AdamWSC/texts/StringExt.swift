
import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ lang: String) -> String {
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            return localized
        }
        guard let bundle = Bundle(path: path) else {
            return localized
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }

}

extension StringKey {
    
    var localized: String {
        return self.rawValue.localized
    }
    
}
