//
//  LoadingShowable.swift
//  Movies
//
//  Created by Berke Alabalik on 19.03.2022.
//

import Foundation
import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    func hideLoading() {
        LoadingView.shared.stopLoading()
    }
}
