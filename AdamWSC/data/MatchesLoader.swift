
import Foundation

class MatchesLoader {
    
    static func load(_ completion: @escaping (Result<[Match],WSCError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { // simulate server call
            guard let matches = loadSync() else {
                DispatchQueue.main.async {
                    completion(.failure(.load))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(matches))
            }
        }
    }
    
    static func loadSync() -> [Match]? {
        guard let url = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let matches = try decoder.decode(Matches.self, from: data)
            let filter = matches.response.filter {
                $0.wscGame != nil
            }
            return filter
        }
        catch {
            return nil
        }
    }
    
}
