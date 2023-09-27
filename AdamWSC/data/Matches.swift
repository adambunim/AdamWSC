
import Foundation

struct Matches: Decodable {
    var response: [Match]
}

struct Match: Decodable, Identifiable {
    var id: String { WSCGameId }
    var WSCGameId: String
    var score: Score? = nil
    var teams: Teams? = nil
    var goals: Goals? = nil
    var league: League? = nil
    var fixture: Fixture? = nil
    var wscGame: WscGame? = nil
}

struct Score: Decodable {
    var fulltime: Goals? = nil
    var halftime: Goals? = nil
    var extratime: Goals? = nil
    var penalty: Goals? = nil
}

struct Goals: Decodable {
    var home: Int? = nil //always nil
    var away: Int? = nil //always nil
}

struct Teams: Decodable {
    var home: Team? = nil
    var away: Team? = nil
}

struct Team: Decodable {
    var name: String? = nil
    var logo: String? = nil
    var id: Int? = nil
    var winner: String? = nil // always nil
}

struct League: Decodable {
    var logo: String? = nil
    var season: Int? = nil
    var country: String? = nil
    var round: String? = nil
    var id: Int? = nil
    var flag: String? = nil
    var name: String? = nil
}

struct Fixture: Decodable {
    var venue: Venue? = nil
    var date: String? = nil
    var referee: String? = nil
    var status: Status? = nil
    var id: Int? = nil
    var timestamp: Int? = nil
    var periods: Periods? = nil
    var timezone: String? = nil
}

struct Periods: Decodable {
    var first: String? = nil //always nil
    var second: String? = nil
}

struct Status: Decodable {
    var long: String? = nil
    var short: String? = nil
    var elapsed: String? = nil //always nil
}

struct Venue: Decodable {
    var name: String? = nil
    var city: String? = nil
    var id: Int? = nil
}

struct WscGame: Decodable {
    var awayTeamName: String? = nil
    var primeStory: PrimeStory? = nil
    var name: String? = nil
    var gameId: String? = nil
    var homeTeamName: String? = nil
    var gameTime: String? = nil
}

struct PrimeStory: Decodable {
    var title: String? = nil
    var storyThumbnailSquare: String? = nil
    var publishDate: String? = nil
    var storyThumbnail: String? = nil
    var storyId: String? = nil
    var pages: [Page]
    var name: String? = nil
}

struct Page: Decodable, Identifiable {
    var id: String { paggeId }
    var duration: Int? = nil
    var paggeId: String
    var videoUrl: String? = nil
    var title: String? = nil
    var awayScore: Int? = nil
    var eventType: String? = nil
    var gameClock: String? = nil
    var homeScore: Int? = nil
    var rating: Int? = nil
    var period: String? = nil
    var actionType: String? = nil
}
