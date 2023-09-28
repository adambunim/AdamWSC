
import XCTest
@testable import AdamWSC

final class AdamWSCTests: XCTestCase {

    func testJsonParse() throws {
        let start = Date()
        let matches = MatchesLoader.loadSync()
        let delta: Double = Date().timeIntervalSince(start)
        XCTAssertEqual(matches?.count, 48)
        XCTAssertLessThan(delta, 0.1)
    }

    func testSingleJsonParse() throws {
        let match = ExampleLoader.load()
        XCTAssertEqual(match?.teams?.home?.name, "Fulham")
        XCTAssertEqual(match?.teams?.away?.name, "Tottenham")
        let pages = match?.wscGame?.primeStory?.pages
        XCTAssertEqual(pages?.count, 11)
        let lastPage = pages?.last
        XCTAssertEqual(lastPage?.homeScore, 0)
        XCTAssertEqual(lastPage?.awayScore, 1)
    }
    
}
