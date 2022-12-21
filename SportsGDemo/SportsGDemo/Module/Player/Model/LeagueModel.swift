//
//  LeagueModel.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import Foundation

// MARK: - Artist
struct AllMatchDetail2: Codable {
    let matchdetail: Matchdetail2?
    let nuggets: [String]?
    let innings: [Inning2]?
    let teams: [String: Team2]?
    let notes: [String: [String]]?
    let name: String?
    let founded: Int?
    let members: [String]?

    enum CodingKeys: String, CodingKey {
        case matchdetail = "Matchdetail"
        case nuggets = "Nuggets"
        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
        case name, founded, members
    }
}

// MARK: - Inning
struct Inning2: Codable {
    let number, battingteam, total, wickets: String
    let overs, runrate, byes, legbyes: String
    let wides, noballs, penalty, allottedOvers: String
    let batsmen: [InningBatsman2]
    let partnershipCurrent: PartnershipCurrent
    let bowlers: [Bowler2]
    let fallofWickets: [FallofWicket2]
    let powerPlay: PowerPlay2
    let target: String?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case battingteam = "Battingteam"
        case total = "Total"
        case wickets = "Wickets"
        case overs = "Overs"
        case runrate = "Runrate"
        case byes = "Byes"
        case legbyes = "Legbyes"
        case wides = "Wides"
        case noballs = "Noballs"
        case penalty = "Penalty"
        case allottedOvers = "AllottedOvers"
        case batsmen = "Batsmen"
        case partnershipCurrent = "Partnership_Current"
        case bowlers = "Bowlers"
        case fallofWickets = "FallofWickets"
        case powerPlay = "PowerPlay"
        case target = "Target"
    }
}

// MARK: - InningBatsman
struct InningBatsman2: Codable {
    let batsman, runs, balls, fours: String
    let sixes, dots, strikerate, dismissal: String
    let howout, bowler, fielder: String
    let isonstrike: Bool?

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
        case fours = "Fours"
        case sixes = "Sixes"
        case dots = "Dots"
        case strikerate = "Strikerate"
        case dismissal = "Dismissal"
        case howout = "Howout"
        case bowler = "Bowler"
        case fielder = "Fielder"
        case isonstrike = "Isonstrike"
    }
}

// MARK: - Bowler
struct Bowler2: Codable {
    let bowler, overs, maidens, runs: String
    let wickets, economyrate, noballs, wides: String
    let dots: String
    let isbowlingtandem, isbowlingnow: Bool?
    let thisOver: [ThisOver2]?

    enum CodingKeys: String, CodingKey {
        case bowler = "Bowler"
        case overs = "Overs"
        case maidens = "Maidens"
        case runs = "Runs"
        case wickets = "Wickets"
        case economyrate = "Economyrate"
        case noballs = "Noballs"
        case wides = "Wides"
        case dots = "Dots"
        case isbowlingtandem = "Isbowlingtandem"
        case isbowlingnow = "Isbowlingnow"
        case thisOver = "ThisOver"
    }
}

// MARK: - ThisOver
struct ThisOver2: Codable {
    let t, b: String

    enum CodingKeys: String, CodingKey {
        case t = "T"
        case b = "B"
    }
}

// MARK: - FallofWicket
struct FallofWicket2: Codable {
    let batsman, score, overs: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
}

// MARK: - PartnershipCurrent
struct PartnershipCurrent2: Codable {
    let runs, balls: String
    let batsmen: [PartnershipCurrentBatsman2]

    enum CodingKeys: String, CodingKey {
        case runs = "Runs"
        case balls = "Balls"
        case batsmen = "Batsmen"
    }
}

// MARK: - PartnershipCurrentBatsman
struct PartnershipCurrentBatsman2: Codable {
    let batsman, runs, balls: String

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
    }
}

// MARK: - PowerPlay
struct PowerPlay2: Codable {
    let pp1, pp2: String

    enum CodingKeys: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
}

// MARK: - Matchdetail
struct Matchdetail2: Codable {
    let teamHome, teamAway: String
    let match: Match2
    let series: Series2
    let venue: Venue2
    let officials: Officials2
    let weather, tosswonby, status, statusID: String
    let playerMatch, result, winningteam, winmargin: String
    let equation: String

    enum CodingKeys: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tosswonby = "Tosswonby"
        case status = "Status"
        case statusID = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningteam = "Winningteam"
        case winmargin = "Winmargin"
        case equation = "Equation"
    }
}

// MARK: - Match
struct Match2: Codable {
    let livecoverage, id, code, league: String
    let number, type, date, time: String
    let offset, daynight: String

    enum CodingKeys: String, CodingKey {
        case livecoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case daynight = "Daynight"
    }
}

// MARK: - Officials
struct Officials2: Codable {
    let umpires, referee: String

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}

// MARK: - Series
struct Series2: Codable {
    let id, name, status, tour: String
    let tourName: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}

// MARK: - Venue
struct Venue2: Codable {
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - Team
struct Team2: Codable {
    let nameFull, nameShort: String
    let players: [String: Player2]

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}

// MARK: - Player
struct Player2: Codable {
    let position, nameFull: String
    let batting: Batting2
    let bowling: Bowling2
    let iscaptain, iskeeper: Bool?

    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case nameFull = "Name_Full"
        case batting = "Batting"
        case bowling = "Bowling"
        case iscaptain = "Iscaptain"
        case iskeeper = "Iskeeper"
    }
}

// MARK: - Batting
struct Batting2: Codable {
    let style: Style2
    let average, strikerate, runs: String

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikerate = "Strikerate"
        case runs = "Runs"
    }
}

enum Style2: String, Codable {
    case lhb = "LHB"
    case rhb = "RHB"
}

// MARK: - Bowling
struct Bowling2: Codable {
    let style, average, economyrate, wickets: String

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }
}

// MARK: - Album
struct Album: Codable {
    let name: String
    let artist: ArtistClass
    let tracks: [Track]
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let name: String
    let founded: Int
    let members: [String]
}

// MARK: - Track
struct Track: Codable {
    let name: String
    let duration: Int
}
