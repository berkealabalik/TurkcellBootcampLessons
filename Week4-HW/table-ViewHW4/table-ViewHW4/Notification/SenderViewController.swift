//
//  SenderViewController.swift
//  table-ViewHW4
//
//  Created by Berke Alabalik on 4.02.2022.
//

import UIKit

class SenderViewController: UIViewController {

    @IBOutlet weak var cityNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func citySend(_ sender: Any) {
        
         let userInfo = [ "" : cityNameField.text ]
         NotificationCenter.default.post(name: .sendCityData, object: nil, userInfo: userInfo as [AnyHashable : Any]) 
        dismiss(animated: true, completion: nil)
    }
  
    
 
}
