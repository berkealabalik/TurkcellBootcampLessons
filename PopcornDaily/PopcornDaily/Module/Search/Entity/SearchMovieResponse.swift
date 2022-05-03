//
//  SearchMovieResponse.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 27.04.2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchedMovieStructure = try? newJSONDecoder().decode(SearchedMovieStructure.self, from: jsonData)

import Foundation

// MARK: - SearchedMovieStructure
struct SearchedMovieStructure: Codable {
    let results: [SearchedMovies]?
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct SearchedMovies: Codable {
    let id: Int?
    let releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case releaseDate = "release_date"
        case title
    }
}
