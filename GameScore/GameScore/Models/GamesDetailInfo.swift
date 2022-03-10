//
//  GamesDetailInfo.swift
//  GameScore
//
//  Created by Berke Alabalik on 8.03.2022.
//




// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamesDetailStruct = try? newJSONDecoder().decode(GamesDetailStruct.self, from: jsonData)


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamesDetailStruct = try? newJSONDecoder().decode(GamesDetailStruct.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamesDetailStruct = try? newJSONDecoder().decode(GamesDetailStruct.self, from: jsonData)

import Foundation

// MARK: - GamesDetailStruct
struct GamesDetailStruct: Codable {
    let descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case descriptionRaw = "description_raw"
    }
}

// MARK: - AddedByStatus
struct AddedByStatusDetails: Codable {
    let yet, owned, beaten, toplay: Int?
    let dropped, playing: Int?
}

// MARK: - Developer
struct DeveloperDetails: Codable {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let domain: String?
    let language: LanguageDetails?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

enum LanguageDetails: String, Codable {
    case eng = "eng"
}

// MARK: - EsrbRating
struct EsrbRatingDetails: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - MetacriticPlatform
struct MetacriticPlatformDetails: Codable {
    let metascore: Int?
    let url: String?
    let platform: MetacriticPlatformPlatformDetails?
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatformDetails: Codable {
    let platform: Int?
    let name, slug: String?
}

// MARK: - ParentPlatform
struct ParentPlatformDetails: Codable {
    let platform: EsrbRating?
}

// MARK: - PlatformElement
struct PlatformElementDetails: Codable {
    let platform: PlatformPlatformDetails?
    let releasedAt: String?
    let requirements: RequirementsDetails?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirements
    }
}

// MARK: - PlatformPlatform
struct PlatformPlatformDetails: Codable {
    let id: Int?
    let name, slug: String?
    let image, yearEnd, yearStart: JSONNullDetails?
    let gamesCount: Int?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - Requirements
struct RequirementsDetails: Codable {
    let minimum: String?
}

// MARK: - Rating
struct RatingDetails: Codable {
    let id: Int?
    let title: String?
    let count: Int?
    let percent: Double?
}

// MARK: - Store
struct StoreDetails: Codable {
    let id: Int?
    let url: String?
    let store: DeveloperDetails?
}

// MARK: - Encode/decode helpers

class JSONNullDetails: Codable, Hashable {

    public static func == (lhs: JSONNullDetails, rhs: JSONNullDetails) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullDetails.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}













/*
import Foundation

// MARK: - GamesDetailStruct
struct GamesDetailStruct: Codable {
    let id: Int?
    let slug, name, nameOriginal, gamesDetailStructDescription: String?
    let metacritic: Int?
    let metacriticPlatforms: [MetacriticPlatformDetails]?
    let released: String?
    let tba: Bool?
    let updated: String?
    let backgroundImage, backgroundImageAdditional: String?
    let website: String?
    let rating: Double?
    let ratingTop: Int?
    let ratings: [RatingDetails]?
    let reactions: [String: Int]?
    let added: Int?
    let addedByStatus: AddedByStatusDetails?
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int?
    let achievementsCount, parentAchievementsCount: Int?
    let redditURL: String?
    let redditName, redditDescription: String?
    let redditLogo: String?
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int?
    let ratingsCount, suggestionsCount: Int?
    let alternativeNames: [String]?
    let metacriticURL: String?
    let parentsCount, additionsCount, gameSeriesCount: Int?
    let userGame: JSONNullDetails?
    let reviewsCount: Int?
    let saturatedColor, dominantColor: String?
    let parentPlatforms: [ParentPlatformDetails]?
    let platforms: [PlatformElementDetails]?
    let stores: [StoreDetails]?
    let developers, genres, tags, publishers: [DeveloperDetails]?
    let esrbRating: EsrbRatingDetails?
    let clip: JSONNullDetails?
    let descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal
        case gamesDetailStructDescription
        case metacritic
        case metacriticPlatforms
        case released, tba, updated
        case backgroundImage
        case backgroundImageAdditional
        case website, rating
        case ratingTop
        case ratings, reactions, added
        case addedByStatus
        case playtime
        case screenshotsCount
        case moviesCount
        case creatorsCount
        case achievementsCount
        case parentAchievementsCount
        case redditURL
        case redditName
        case redditDescription
        case redditLogo
        case redditCount
        case twitchCount
        case youtubeCount
        case reviewsTextCount
        case ratingsCount
        case suggestionsCount
        case alternativeNames
        case metacriticURL
        case parentsCount
        case additionsCount
        case gameSeriesCount
        case userGame
        case reviewsCount
        case saturatedColor
        case dominantColor
        case parentPlatforms
        case platforms, stores, developers, genres, tags, publishers
        case esrbRating
        case clip
        case descriptionRaw
    }
}

// MARK: - AddedByStatus
struct AddedByStatusDetails: Codable {
    let yet, owned, beaten, toplay: Int?
    let dropped, playing: Int?
}

// MARK: - Developer
struct DeveloperDetails: Codable {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let domain: String?
    let language: LanguageDetails?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount
        case imageBackground
        case domain, language
    }
}

enum LanguageDetails: String, Codable {
    case eng = "eng"
}

// MARK: - EsrbRating
struct EsrbRatingDetails: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - MetacriticPlatform
struct MetacriticPlatformDetails: Codable {
    let metascore: Int?
    let url: String?
    let platform: MetacriticPlatformPlatformDetails?
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatformDetails: Codable {
    let platform: Int?
    let name, slug: String?
}

// MARK: - ParentPlatform
struct ParentPlatformDetails: Codable {
    let platform: EsrbRatingDetails?
}

// MARK: - PlatformElement
struct PlatformElementDetails: Codable {
    let platform: PlatformPlatformDetails?
    let releasedAt: String?
    let requirements: RequirementsDetails?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt
        case requirements
    }
}

// MARK: - PlatformPlatform
struct PlatformPlatformDetails: Codable {
    let id: Int?
    let name, slug: String?
    let image, yearEnd, yearStart: JSONNullDetails?
    let gamesCount: Int?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd
        case yearStart
        case gamesCount
        case imageBackground
    }
}

// MARK: - Requirements
struct RequirementsDetails: Codable {
    let minimum: String?
}

// MARK: - Rating
struct RatingDetails: Codable {
    let id: Int?
    let title: String?
    let count: Int?
    let percent: Double?
}

// MARK: - Store
struct StoreDetails: Codable {
    let id: Int?
    let url: String?
    let store: DeveloperDetails?
}

// MARK: - Encode/decode helpers

class JSONNullDetails: Codable, Hashable {

    public static func == (lhs: JSONNullDetails, rhs: JSONNullDetails) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullDetails.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


*/
