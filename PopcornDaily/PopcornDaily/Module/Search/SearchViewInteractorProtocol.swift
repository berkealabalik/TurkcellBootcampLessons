//
//  SearchViewInteractorProtocol.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 27.04.2022.
//

import Foundation
protocol SearchViewInteractorProtocol {
    func fetchSearchedMovies(with word : String)
}
protocol SearchViewInteractorOutputProtocol {
    func fetchSearchedMoviesOutput(result : SearchedMoviesResult)
}
typealias SearchedMoviesResult = Result<SearchedMovieStructure , Error>
fileprivate var movieSearchService : MovieServiceProtocol = MovieService()
final class SearchViewInteractor {
    var output : SearchViewInteractorOutputProtocol?
}

extension SearchViewInteractor : SearchViewInteractorProtocol {
    func fetchSearchedMovies(with word: String) {
        movieSearchService.fetchSearchedMovies(Searchedword: word) { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchSearchedMoviesOutput(result: result)
        }
    }
}
