//
//  ServiceManager.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation

protocol MovieServiceProtocol {
    
    func fetchSlider(completionHandler: @escaping (NowPlayingResult) -> ()) // now_playin
    func fetchUpcoming(completionHandler: @escaping (NowPlayingResult) -> ())
    func fetchMovieDetail(movieId : String , completionHandler : @escaping (MovieDetailResult) -> ())
    func fetchSimilarMovies(movieID : String , completionHandler : @escaping (SimilarMoviesResult) -> ())
    func fetchSearchedMovies(Searchedword : String , completionHandler : @escaping (SearchedMoviesResult) -> ())
}

struct MovieService: MovieServiceProtocol {
    func fetchSearchedMovies(Searchedword: String, completionHandler: @escaping (SearchedMoviesResult) -> ()) {
        NetworkManager.shared.request(Router.searchMovie(searchWord: Searchedword), decodeToType: SearchedMovieStructure.self, completionHandler: completionHandler)
    }
    
    func fetchSimilarMovies(movieID: String, completionHandler: @escaping (SimilarMoviesResult) -> ()) {
            NetworkManager.shared.request(Router.SimilarMovies(movieId: movieID), decodeToType: SimilarMoviesStruct.self, completionHandler: completionHandler)
        }
    func fetchMovieDetail(movieId: String, completionHandler: @escaping ((MovieDetailResult) -> ())) {
        NetworkManager.shared.request(Router.MovieDetail(movieId: movieId), decodeToType: MovieDetail.self, completionHandler: completionHandler)
    }
    
    func fetchUpcoming(completionHandler: @escaping (NowPlayingResult) -> ()) {
        NetworkManager.shared.request(Router.UpcomingList, decodeToType: NowPlaying.self, completionHandler: completionHandler)
    }
    
    func fetchSlider(completionHandler: @escaping (NowPlayingResult) -> ()) {
        NetworkManager.shared.request(Router.nowPlaying, decodeToType: NowPlaying.self, completionHandler: completionHandler)
    }
}
