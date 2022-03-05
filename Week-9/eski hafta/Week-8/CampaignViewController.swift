//
//  CampaignViewController.swift
//  Week-8
//
//  Created by Egitim on 26.02.2022.
//

import UIKit
class CampaignViewController: UIViewController {
    let alert = UIAlertController(title: "Veri Alınamadı", message: "Lütfen Geçerli Bir Veri URL Giriniz!", preferredStyle: UIAlertController.Style.alert)
    
    @IBOutlet weak var tableView: UITableView!
    
    var campaigns = [Campaign]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let campainRequest = CampaignRequest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(UIAlertAction(title: "Tamam",style:UIAlertAction.Style.default,handler: nil))
        // Do any additional setup after loading the view.
        campainRequest.getCampaign { result in
            switch result {
                       case .success(let campaigns):
                           self.campaigns = campaigns
                       case .failure(let error):
                           print(error.localizedDescription)
            }
            
        }
    }

}

extension CampaignViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campaigns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "campaignCell", for: indexPath)
        cell.textLabel?.text = campaigns[indexPath.row].baslik
        return cell
    }
    
    
}
