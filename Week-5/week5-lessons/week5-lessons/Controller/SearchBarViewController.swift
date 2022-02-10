//
//  SearchBarViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 4.02.2022.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDataSource {
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering  : Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string : urlStr) else { return }
        //let data = try? Data(contentsOf: userURL) Bunun yerine contents of aşşağıdaki kullanım .
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL)) // bu decode throw yani hata fırlattığı için başına try koyduk . User []  içine koyduk çünkü json yapısı öyle geliyor userlar ise {} böyle dikkat et !
        
        guard let users = userList else {return}
        self.users = users
        // Do any additional setup after loading the view.
       
        tableView.dataSource = self
    }
    
}
    
extension SearchBarViewController {
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
    

// SEARCHBAR EXTENSİON

extension SearchBarViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.username!.lowercased().contains(searchText.lowercased())
        })
        isFiltering = true
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}


// ÖDEV : search barda elle kelimeyi silince tüm verileri geri getirmelisiniz
// ÖDEV : eğer veri bulunamıyorsa custom bir view oluşturarak kullanıcıya onu göstermelisiniz .
