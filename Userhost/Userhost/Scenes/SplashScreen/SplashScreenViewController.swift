//
//  SplashScreenViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 2.04.2022.
//

import UIKit
import Lottie
class SplashScreenViewController: UIViewController {
    @IBOutlet weak var splashAnimation: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        splashAnimation.loopMode = .loop
        splashAnimation.animationSpeed = 1
        splashAnimation.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1300)) {
            self.performSegue(withIdentifier: "OpenUsers", sender: nil)
        }
    }
}
