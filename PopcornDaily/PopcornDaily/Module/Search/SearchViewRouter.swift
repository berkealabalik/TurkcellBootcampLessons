//
//  SearchViewRouter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 28.04.2022.
//

import Foundation
protocol SearchViewRouterProtocol : AnyObject {
    func navigate(_ route : SearchRoutes)
}
enum SearchRoutes {
    case detail(movie : Int?)
    case dismissView
}
final class SearchViewRouter {
    weak var viewController : SearchViewController?
    static func createModule() -> SearchViewController {
       
        let view = SearchViewController()
        let interactor = SearchViewInteractor()
        let router = SearchViewRouter()
        let presenter = SearchViewPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension SearchViewRouter : SearchViewRouterProtocol {
    func navigate(_ route: SearchRoutes) {
        switch route {
        case .detail(let movieID):
            let MovieDetailVC = MovieDetailRouter.createModule()
            MovieDetailVC.MovieID = movieID
            viewController?.modalPresentationStyle = .overCurrentContext
            viewController?.present(MovieDetailVC, animated : true)
        case .dismissView:
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
