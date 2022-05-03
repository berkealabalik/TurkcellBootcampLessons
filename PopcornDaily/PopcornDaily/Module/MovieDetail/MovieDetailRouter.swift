//
//  MovieDetailRouter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 26.04.2022.
//

import Foundation
import UIKit
protocol MovieDetailRouterProtocol : AnyObject {
    func navigate(_ route : MovieDetailRoutes)
}
enum MovieDetailRoutes {
    case openSimilarMovie(movieID : Int)
    case OpenImdb(url : URL)
}

final class MovieDetailRouter {
    weak var viewController : MovieDetailViewController?
    static func createModule() -> MovieDetailViewController {
        let view = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension MovieDetailRouter : MovieDetailRouterProtocol {
    func navigate(_ route: MovieDetailRoutes) {
        switch route {
        case .openSimilarMovie(let movieID):
            let MovieDetailVC = MovieDetailRouter.createModule()
            MovieDetailVC.MovieID = movieID
            viewController?.navigationController?.pushViewController(MovieDetailVC, animated: true)
        case .OpenImdb(let url):
            UIApplication.shared.open(url)
        }
    }
}
