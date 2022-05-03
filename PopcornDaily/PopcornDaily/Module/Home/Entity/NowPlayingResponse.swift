//
//  NowPlayingResponse.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//


import Foundation

struct NowPlaying: Codable {
    let results: [ResultMovies]?
}

struct ResultMovies: Codable {
    let id : Int?
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

