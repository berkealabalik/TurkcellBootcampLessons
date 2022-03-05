//
//  ReservationListViewController.swift
//  ReservationApp
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

class ReservationListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ReservationInsertCell", bundle: nil), forCellReuseIdentifier: "checkCell")
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
        
        
    }
    

    

}

extension ReservationListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkCell", for: indexPath) as! ReservationInsertCell
        cell.delegate = self
        
        
        return cell
    }
    
}


extension ReservationListViewController : ReservationInsertCellDelegate {
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    
}
