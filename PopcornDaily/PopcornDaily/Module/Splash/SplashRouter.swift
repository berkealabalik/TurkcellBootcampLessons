//
//  SplashRouter.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation
import UIKit
protocol SplashRouterProtocol : AnyObject {
    func navigateTo(_ route : SplashRoutes)
}
enum SplashRoutes {
    case homeScreen
}

final class SplashRouter {
    weak var viewController : SplashViewController?
    static func createModule() -> SplashViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension SplashRouter : SplashRouterProtocol {
    func navigateTo(_ route: SplashRoutes) {
        switch route {
        case .homeScreen:
            guard let window = viewController?.view.window else { return }
            let homeVC = HomeRouter.createModule()
            let navigationController = UINavigationController(rootViewController: homeVC)
            window.rootViewController = navigationController
        }
    }
}
