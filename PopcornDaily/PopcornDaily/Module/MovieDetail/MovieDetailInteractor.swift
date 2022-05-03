//
//  MovieDetailInteractor.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 26.04.2022.
//

import Foundation
protocol MovieDetailInteractorProtocol : AnyObject {
    func fetchMovieDetail(with movieId : String)
}

protocol MovieDetailInteractorOutputProtocol : AnyObject {
    func fetchMoviesDetailOutput(result : MovieDetailResult, similarMovies : SimilarMoviesResult)
}
typealias SimilarMoviesResult = Result<SimilarMoviesStruct,Error>
typealias MovieDetailResult = Result<MovieDetail, Error>
fileprivate var moviesService : MovieServiceProtocol = MovieService()
final class MovieDetailInteractor {
    var output : MovieDetailInteractorOutputProtocol!
}

extension MovieDetailInteractor : MovieDetailInteractorProtocol {
    func fetchMovieDetail(with movieId: String) {
        moviesService.fetchMovieDetail(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            moviesService.fetchSimilarMovies(movieID: movieId) { [weak self] similar in
                self?.output.fetchMoviesDetailOutput(result: result , similarMovies: similar)
            }
        }
    }
}


