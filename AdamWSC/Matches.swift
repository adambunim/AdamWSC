
import Foundation

struct Matches: Decodable {
    var response: [Match]
}

struct Match: Decodable {
    var WSCGameId: String? = nil
    var score: Score? = nil
    var teams: Teams? = nil
    var goals: Goals? = nil
    var league: League? = nil
    var fixture: Fixture? = nil
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
