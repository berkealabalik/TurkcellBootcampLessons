//
//  ViewController.swift
//  Week-8
//
//  Created by Egitim on 19.02.2022.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    var counter = 1
    var ref: DatabaseReference!
    var users = [User]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getSnapshot()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
        
        
        /*users.append(User(userId: "1", name: "Bahattin"))
         users.append(User(userId: "2", name: "Mert"))
         users.append(User(userId: "3", name: "Ali Can"))
         
         for user in users {
         self.ref.child("users").child(user.userId ?? "").setValue(["username": user.name])
         } // kullanıcı Ekleme self.ref kısmı .
         
         getData(user: users.first!)*/
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.reloadData()
        }
        
        print("Users:", self.users)
    }
    
    func getSnapshot() {
        /*ref.observe(DataEventType.value) { snapshot in
         print(snapshot.childSnapshot(forPath: "users").value)
         }*/
        
        let ref = Database.database().reference().child("users")
        ref.observeSingleEvent(of: .value, with: { (snap : DataSnapshot)  in
            for child in snap.children {
                let key = (child as AnyObject).key as String
                self.getData(key: key)
                print("asd: ", key)
                
            }
        }) { (err: Error) in
            print("\(err.localizedDescription)")
        }
    }
    
    
    func getData(key: String) {
        ref.child("users/\(key)/username").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            let userName = snapshot.value as? String ?? "Unknown"
            self.users.append(User(userId: key, name: userName))
            print("Kullanıcı Adı: ", userName)
            print("Users 2: ", self.users)
        })
    }
    
    
    @IBAction func insertAction(_ sender: Any) {
        
                var text = ""
                let alertView = UIAlertController(title: "Ekle", message: "Kullanıcı Ekle", preferredStyle: .alert)
                alertView.addTextField { textField in
                    text = textField.text!
                }
                alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                    let user = User(userId: "\(self.counter)", name: "\(alertView.textFields![0].text ?? "")")
                    self.ref.child("users").child(user.userId ?? "").setValue(["username": user.name])
                    self.counter += 1
                    self.getSnapshot() // tabloyu geri yenilmek için .
                }))
                
                present(alertView, animated: true, completion: nil)
            }
    
}


struct User {
    let userId: String?
    let name: String?
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        cell.textLabel?.text = users[indexPath.row].name
        
        return cell
    }
    
    
}
