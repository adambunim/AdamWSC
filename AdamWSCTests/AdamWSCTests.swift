
import XCTest
@testable import AdamWSC

final class AdamWSCTests: XCTestCase {

    func testJsonParse() throws {
        let matches = MatchesLoader.loadSync()
        XCTAssertEqual(matches?.count, 48)
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
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
