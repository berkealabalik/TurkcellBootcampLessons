//
//  NotificationSenderVC.swift
//  Week4Hw
//
//  Created by Berke Alabalik on 2.02.2022.
//

import UIKit

class NotificationSenderVC: UIViewController {

    @IBOutlet weak var cityFamousField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    // yapılacak veriyi alacagım menthod burda
    @IBAction func sendNotification(_ sender: UIButton) {

        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: [ "" : (userNameField.text ?? "Empty") as String ]) // name hangi kanal , object nil , user info eğer bir datada göndermek istiyorsam .
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: ["CityFamous" : (cityFamousField.text ?? "Empty") as String ])
        dismiss(animated: true, completion: nil)
    }
    
   

}
