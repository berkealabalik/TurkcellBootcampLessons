//
//  UserDefaultViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 5.02.2022.
//

import UIKit
import KeychainAccess
class UserDefaultViewController: UIViewController {
   
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var intTextField: UITextField!
    
    let keychain = Keychain(service: "com.berkealabalik.week5")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

      
        /*infoLabel.text = UserDefaults.standard.value(forKey: "info") as? String  / Default data örneği*/
        let name = keychain["name"]
        let age = keychain["age"]
        
        infoLabel.text = "\(name!) Yaşım \(age!)"
    }
    

    @IBAction func saveInfo(_ sender: Any) {
        /* DEFAULT DATA ÖRNEĞİ
        let info = infoTextField.text! + " Yaşım "  + intTextField.text!
        
        /* YADA ALTERNATİF
        let age = intTextField.text
        //UserDefaults.standard.set(age, forKey: "age")
         */
        UserDefaults.standard.set(info, forKey: "info")
        infoTextField.text = ""
        infoLabel.text = info
         */
        
        keychain["name"] = infoTextField.text
        keychain["age"] = intTextField.text
        
        infoLabel.text = infoTextField.text! + " Yaşım " + intTextField.text!
    }
    

}
