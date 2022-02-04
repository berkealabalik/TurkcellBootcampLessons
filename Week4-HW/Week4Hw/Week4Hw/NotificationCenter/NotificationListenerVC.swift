//
//  NotificationListenerVC.swift
//  Week4Hw
//
//  Created by Berke Alabalik on 2.02.2022.
//

import UIKit

class NotificationListenerVC: UIViewController {
    @IBOutlet weak var notificationMessageLabel: UILabel!
    
    @IBOutlet weak var listenerImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let notificationCenter : NotificationCenter = .default
      
        notificationCenter.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil) // observer : kısmı self yani dinleyici , selector : haber gelince ne yapılcak ? ,
        notificationCenter.addObserver(self, selector: #selector(self.setText(_:)), name: .sendDataNotification, object: nil)

        // Do any additional setup after loading the view.
    }
   
    @objc func changeImage(_ notification : Notification) { // ismi kendimiz belirledik selectorun yapacağı func .
        
        let cityImage : [String:Any] = notification.userInfo as Any as! [String : Any]
        print(cityImage)
        self.listenerImg.image = UIImage(named: cityImage["CityFamous"] as! String )
        
        
    }
    
    @objc func setText(_ notification : Notification) {
        let name_text : [String:Any] = notification.userInfo as Any as! [String : Any]
        
        self.notificationMessageLabel.text = "City Name Is : \(name_text[""]!)"
    }


}
