//
//  FirstViewController.swift
//  Week7-Lesson
//
//  Created by Berke Alabalik on 19.02.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarConfig()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnAction(_ sender: Any) {
        label.text = "Değişti butonla"
    }
    
    private func tabbarConfig() {
        guard let tabbar = tabBarController?.tabBar else { return }
        
        tabbar.tintColor = .black
        tabbar.backgroundColor = .orange
        tabbar.unselectedItemTintColor = .lightGray
        
        
        tabbar.layer.cornerRadius = 10
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabbar.layer.masksToBounds = true
        
        tabbar.layer.borderWidth = 2
        tabbar.layer.borderColor = UIColor.separator.cgColor
        
        
        // ÖDEV : Clipsto ve mask to bound nedir ?  nasıl ve ne zaman kullanılır ?
        // ÖDEV : Tabbar için orta button ön planda çıkar .
    }
    
}
