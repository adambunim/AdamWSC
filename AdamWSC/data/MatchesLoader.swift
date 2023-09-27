
import Foundation

class MatchesLoader {
    
    static func load(_ completion: @escaping (Result<[Match],WSCError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            completion(.failure(.load))
            return
        }
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2.0) { // simulate server call
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let matches = try decoder.decode(Matches.self, from: data)
                let filter = matches.response.filter {
                    $0.wscGame != nil
                }
                DispatchQueue.main.async {
                    completion(.success(filter))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(.load))
                }
            }
        }
    }
    
}
