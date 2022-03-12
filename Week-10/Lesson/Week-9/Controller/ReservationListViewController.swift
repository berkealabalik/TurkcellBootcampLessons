//
//  ReservationListViewController.swift
//  Week-9
//
//  Created by Egitim on 5.03.2022.
//

import UIKit

class ReservationListViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ReservationInsertCell", bundle: nil), forCellReuseIdentifier: "reservationInsertCell")
        self.hideKeyboardWhenTappedAround()
    }
    

}

extension ReservationListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationInsertCell", for: indexPath) as! ReservationInsertCell
        cell.delegate = self // Delegate im ReservationListViewController
        return cell
    }
    
}


extension ReservationListViewController: ReservationInsertCellDelegate {
    func reloadTable() {
        self.tableView.reloadData()
    }
}
