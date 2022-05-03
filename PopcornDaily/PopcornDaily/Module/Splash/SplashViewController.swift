//
//  SplashViewController.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//
import UIKit
import Lottie
protocol SplashViewControllerProtocol : AnyObject {
    func noInternetConnection()
}


class SplashViewController: BaseViewController {
    @IBOutlet weak var splashAnimation: AnimationView!
    var presenter : SplashPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        splashAnimation.loopMode = .loop
        splashAnimation.animationSpeed = 1.25
        splashAnimation.play()
        presenter.viewDidAppear()
    }
}

extension SplashViewController : SplashViewControllerProtocol {
    func noInternetConnection() {
        showAlert(title: "No Internet Connection", message: "Please Connect Internet and Restart Application")
    }
    
    
}
