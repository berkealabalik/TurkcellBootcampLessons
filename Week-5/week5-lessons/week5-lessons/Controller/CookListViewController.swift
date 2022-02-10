//
//  CookListViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 5.02.2022.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {
    var cookNames = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getCooks()
    }
    
    private func getCooks() {
        cookNames.removeAll() // aray içi başlamadan boşalttık.
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cooks")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else {return}
                    cookNames.append(name)
                }
                self.tableView.reloadData()
            }else {
                //Todo Hata verebilir
            }
        } catch  {
            print("Veri Çekilemedi")
        }
    }

    

}

extension CookListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
        cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell")
        cell?.textLabel?.text = cookNames[indexPath.row]
        return cell!
    }
    
    
}
