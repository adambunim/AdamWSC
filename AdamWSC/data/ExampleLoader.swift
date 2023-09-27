
import Foundation

class ExampleLoader {
    
    static func load() -> Match? {
        guard let url = Bundle.main.url(forResource: "example", withExtension: "json") else {
            print("no file")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(Match.self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
