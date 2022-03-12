//
//  GamesDetailInfo.swift
//  GameScore
//
//  Created by Berke Alabalik on 8.03.2022.
//




import Foundation

// MARK: - GamesDetailStruct
struct GamesDetailStruct: Codable {
    let descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case descriptionRaw = "description_raw"
    }
}







