
import Foundation

class MatchesLoader {
    
    static func load() throws -> Matches {
        guard let url = Bundle.main.url(forResource: "wordsOrigin", withExtension: "json") else {
            throw WSCError.runtime(.file_not_found)
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Matches.self, from: data)
    }
    
}
