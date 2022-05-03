//
//  SearchViewPresenter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 27.04.2022.
//

import Foundation
import SwiftUI
protocol SearchViewPresenterProtocol {
    func viewDidLoad()
    func numberOfItems() -> Int
    func searchMoviesInformation(_ index : Int) -> SearchedMovies
    func didSelectRow(index : Int)
    func searchMovie(word : String)
}
final class SearchViewPresenter : SearchViewPresenterProtocol {
    private var SearchedMovieList : [SearchedMovies] = []
    unowned var view : SearchViewControllerProtocol?
    let router : SearchViewRouterProtocol!
    let interactor : SearchViewInteractorProtocol!
    init(view : SearchViewControllerProtocol , router : SearchViewRouterProtocol , interactor : SearchViewInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    private func fetchSearchedMovies(with word : String) {
        if word.count > 2 {
            view?.showLoadingView()
            interactor.fetchSearchedMovies(with: word)
        }
    }
    
    func viewDidLoad() {
        fetchSearchedMovies(with: view?.getSearchWord() ?? "")
    }
    
    func numberOfItems() -> Int {
        SearchedMovieList.count
    }
    
    func searchMoviesInformation(_ index: Int) -> SearchedMovies {
        SearchedMovieList[index]
    }
    
    func didSelectRow(index: Int) {
        router.navigate(.detail(movie: SearchedMovieList[index].id))
    }
    
    func searchMovie(word: String) {
        fetchSearchedMovies(with: word)
    }
    
}

extension SearchViewPresenter : SearchViewInteractorOutputProtocol {
    func fetchSearchedMoviesOutput(result: SearchedMoviesResult) {
        switch result {
        case .success(let searchedMovies):
            SearchedMovieList = searchedMovies.results ?? SearchedMovieList
           
        case .failure(let error):
            print(error)
        }
        view?.configureData()
        view?.reloadData()
        view?.hideLoadingView()
    }
}
