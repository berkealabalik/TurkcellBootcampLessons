//
//  SimilarMoviesResponse.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 27.04.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let similarMovies = try? newJSONDecoder().decode(SimilarMovies.self, from: jsonData)

import Foundation

// MARK: - SimilarMovies
struct SimilarMoviesStruct: Codable {
    let page: Int?
    let results: [SimilarMovieDetail]?
   
    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

// MARK: - Result
struct SimilarMovieDetail: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let title: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id, title
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

