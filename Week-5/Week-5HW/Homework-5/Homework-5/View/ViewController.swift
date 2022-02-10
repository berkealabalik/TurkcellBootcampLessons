//
//  ViewController.swift
//  Homework-5
//
//  Created by Berke Alabalik on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {
 //var cars = []
    @IBOutlet weak var carsTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UISearchBar : UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        <#code#>
    }
    
}

extension UITableView : UITableViewDelegate , UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
