//
//  SearchViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 5.02.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var users = [User]()
    var filteredUsers = [User]()
    var isSearchBarEmpty : Bool {
        return searchController.searchBar.text?.isEmpty ?? true
        
    }
    var isFiltering : Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
         searchController.title = "Arama"

         let urlStr = "https://jsonplaceholder.typicode.com/users"
         guard let userURL = URL(string : urlStr) else { return }
         //let data = try? Data(contentsOf: userURL) Bunun yerine contents of aşşağıdaki kullanım .
         let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL)) // bu decode throw yani hata fırlattığı için başına try koyduk . User []  içine koyduk çünkü json yapısı öyle geliyor userlar ise {} böyle dikkat et !
         
         guard let users = userList else {return}
         self.users = users
         
         
        tableView.dataSource=self
        
    }
    
    private func configureSearchController() { // dışardan erişlimeyen func
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }
    
    func filterContextForSearchText (searchText : String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.username!.lowercased().contains(searchText.lowercased())
        })
        
    }


}

extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering { return filteredUsers.count }
        
        return users.count // Users
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        let user : User
        
        if isFiltering {
            user = filteredUsers[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        
        cell?.textLabel?.text = user.username
        cell?.detailTextLabel?.text = user.email
        return cell!
    }
    
    
}

extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchText(searchText : searchBar.text!)
        
    }
    
    
    
}
