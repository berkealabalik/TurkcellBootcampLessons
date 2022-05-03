//
//  HomePresenter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation

protocol HomePresenterProtocol : AnyObject {
    func viewDidAppear()
    func numofItemsSlider() -> Int
    func numofItemsTable() -> Int
    func GetsliderMovies(_ index : Int) -> ResultMovies?
    func GettableMovies(_ index : Int) -> ResultMovies
    func didSelectRowAtSlider(index : Int)
    func didSelectRowAt(index : Int)
    func searchBarRoute(word : String)
}

final class HomePresenter : HomePresenterProtocol {
    unowned var view : HomeViewControllerProtocol?
    let router : HomeRouterProtocol!
    let interactor : HomeInteractorProtocol!
    private var SliderMovies : [ResultMovies] = []
    private var TableMovies : [ResultMovies] = []
    init(view : HomeViewControllerProtocol, router : HomeRouterProtocol , interactor : HomeInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    func GetsliderMovies(_ index: Int) -> ResultMovies? {
        return SliderMovies[index]
    }
    
    func GettableMovies(_ index: Int) -> ResultMovies {
        return TableMovies[index]
    }
    
    func didSelectRowAtSlider(index: Int) {
        router.navigateTo(.Detail(movieID: SliderMovies[index].id))
    }
    
    func didSelectRowAt(index: Int) {
        router.navigateTo(.Detail(movieID: TableMovies[index].id))
    }
    func viewDidAppear() {
        view?.setupSlider()
        view?.setupTableView()
        view?.setupSearchBar()
        fetchMovies()
    }
    
    func numofItemsSlider() -> Int {
        SliderMovies.count
    }
    
    func numofItemsTable() -> Int {
        TableMovies.count
    }
    private func fetchMovies() {
        view?.showLoading()
        interactor.fetchMovies()
    }
    
    func searchBarRoute(word: String) {
        router.navigateTo(.searchBar(searchedWord: word))
    }
}

extension HomePresenter : HomeInteractorOutputProtocol {
    func fetchMoviesOutput(result : NowPlayingResult , tableResult : NowPlayingResult) {
        view?.hideLoading()
        switch result {
        case .success(let res):
            SliderMovies = res.results ?? []
        case .failure(let error):
            print(error)
        }
        switch tableResult {
        case .success(let tableResult):
            TableMovies = tableResult.results ?? []
        case .failure(let error):
            print(error)
            
        }
        view?.reloadData()
        
    }
    
    
}
