//
//  MovieDetailPresenter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 26.04.2022.
//

import Foundation
protocol MovieDetailPresenterProtocol : AnyObject {
    func viewDidLoad()
    func similarMovieNumberOfItems() -> Int
    func movieSelected(_ index : Int) -> MovieDetail
    func similarMovies(_ index : Int) -> SimilarMovieDetail
    func didpressSimilarMovie(index : Int)
    func didpressButton(imdb : String)
    func addFavorite(url: String)
}

final class MovieDetailPresenter : MovieDetailPresenterProtocol {
    private var Movie : [MovieDetail] = []
    private var SimilarMovies : [SimilarMovieDetail] = []
    unowned var view: MovieDetailViewControllerProtocol?
    let router: MovieDetailRouterProtocol!
    let interactor: MovieDetailInteractorProtocol!
    
    init(view : MovieDetailViewControllerProtocol , router : MovieDetailRouterProtocol , interactor : MovieDetailInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    private func fetchMovieDetail(with MovieID : String) {
        view?.showLoadingView()
        interactor.fetchMovieDetail(with: MovieID)
    }
    
    func viewDidLoad() {
        fetchMovieDetail(with: (view?.getMovieId())!)
    }
    
    func similarMovieNumberOfItems() -> Int {
        return SimilarMovies.count
    }
    
    func movieSelected(_ index: Int) -> MovieDetail {
        Movie[index]
    }
    func addFavorite(url: String) {
        
    }
    func didpressButton(imdb : String) {
        let url = "https://www.imdb.com/title/" + imdb
        router.navigate(.OpenImdb(url: URL(string : url)!))
    }
    func similarMovies(_ index: Int) -> SimilarMovieDetail {
        SimilarMovies[index]
    }
    
    func didpressSimilarMovie(index: Int) {
        router.navigate(.openSimilarMovie(movieID: similarMovies(index).id ?? 0))
    }
}

extension MovieDetailPresenter : MovieDetailInteractorOutputProtocol {
    func fetchMoviesDetailOutput(result: MovieDetailResult, similarMovies: SimilarMoviesResult) {
        switch result {
        case .success(let movieDetail):
            Movie = [movieDetail]
        case .failure(let error):
            print(error)
        }
        switch similarMovies {
        case .success(let similarMovies):
            SimilarMovies = similarMovies.results ?? SimilarMovies
        case .failure(let error):
            print(error)
        }
        view?.hideLoadingView()
        view?.reloadData()
        view?.configureData()
    }
}
