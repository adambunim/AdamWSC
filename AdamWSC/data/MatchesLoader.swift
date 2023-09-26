
import Foundation

class MatchesLoader {
    
    static func load() -> Result<[Match],WSCError> {
        guard let url = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            return .failure(.runtime(.failed_to_load_matches))
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let matches = try decoder.decode(Matches.self, from: data)
            return .success(matches.response)
        }
        catch {
            return .failure(.runtime(.failed_to_load_matches))
        }
    }
    
}
