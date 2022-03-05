//
//  CampaignViewController.swift
//  Week-8
//
//  Created by Berke Alabalik on 26.02.2022.
//

//Swagger Varsa adrsin açıklamaları olur bir bak .

import UIKit


class CampaignViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var campaigns = [Campaign]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData() // içeriye birşey yazılmışssa tabloyu yenile .
            }
        }
    }
let campaignRequest = CampaignRequest()
    override func viewDidLoad() {
        super.viewDidLoad()
        campaignRequest.getCampaign() { [self] (result) in
            switch result {
            case .success(let cam):
                self.campaigns = data
            case .failure(.noDataAvailable):
                print("Error")
            case .failure(.canNotProcessData):
                print("ERROR")
            }
        }
        print(campaigns)
        
            
            
            
        }
       

   
}
    


extension CampaignViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        campaigns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "campaignCell", for: indexPath)
        cell.textLabel!.text = campaigns[indexPath.row].baslik
        return cell
    }
    
    
}
