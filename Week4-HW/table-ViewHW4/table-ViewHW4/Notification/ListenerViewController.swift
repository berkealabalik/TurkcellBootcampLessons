//
//  ListenerViewController.swift
//  table-ViewHW4
//
//  Created by Berke Alabalik on 4.02.2022.
//

import UIKit
var city_data = ["Ankara","Adıyaman"]
class ListenerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let notificationCenter : NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(self.addCity(_:)), name: .sendCityData, object: nil) //
    }
  
    

    
    
    
    @objc func addCity(_ notification : Notification) {
        guard let text = notification.userInfo?[""] as? String else { return }
        city_data.append(text)
        tableView.reloadData()
        print(city_data)
       
    }
    


}

extension ListenerViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        city_data.count
    }
    
    func tableView(_ tableView : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = city_data[indexPath.row]
        return cell
    }
    
    
    
    
}
