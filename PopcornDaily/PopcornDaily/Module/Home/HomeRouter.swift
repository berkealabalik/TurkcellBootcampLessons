//
//  HomeRouter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation
protocol HomeRouterProtocol {
    func navigateTo(_ route: HomeRoutes)
}

enum HomeRoutes {
    case Detail(movieID : Int?)
    case searchBar(searchedWord : String?)
}

final class HomeRouter {
        weak var viewController : HomeViewController?
        
        static func createModule() -> HomeViewController {
            let view = HomeViewController()
            let interactor = HomeInteractor()
            let router = HomeRouter()
            let presenter = HomePresenter(view: view, router: router, interactor: interactor)
            view.presenter = presenter
            interactor.output = presenter
            router.viewController = view
            return view
        }
}

extension HomeRouter : HomeRouterProtocol {
    func navigateTo(_ route: HomeRoutes) {
        switch route {
        case .Detail(let movieID):
            let MovieDetailVC = MovieDetailRouter.createModule()
            MovieDetailVC.MovieID = movieID
            viewController?.navigationController?.pushViewController(MovieDetailVC, animated: true)
        case .searchBar(let searchedWord):
            let SearchVC = SearchViewRouter.createModule()
            SearchVC.searchWord = searchedWord
            viewController?.navigationController?.pushViewController(SearchVC, animated: true)
        }
    }
    
    
}
