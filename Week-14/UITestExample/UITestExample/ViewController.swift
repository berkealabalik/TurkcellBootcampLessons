//
//  ViewController.swift
//  UITestExample
//
//  Created by Egitim on 9.04.2022.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAccessibilityIdentifiers()
    }


}

extension ViewController {
    
    func setAccessibilityIdentifiers() {
        usernameTextField.accessibilityIdentifier = "usernameTextField"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        doneButton.accessibilityIdentifier = "doneButton"
    }
}
