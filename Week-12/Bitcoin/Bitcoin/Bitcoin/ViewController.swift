//
//  ViewController.swift
//  Bitcoin
//
//  Created by Berke Alabalik on 19.03.2022.
//

import UIKit
import BitcoinAPI
class ViewController: UIViewController {
    @IBOutlet weak var coinsTableView: UITableView!
    
    let coinService : BitcoinServiceProtocol = BitcoinService()
    private var coins : [Coin] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        coinsTableView.register(cellType: CoinTableViewCell.self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoins()
    }
    
    fileprivate func fetchCoins() {
        coinService.fetchCoins { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let coinData):
                DispatchQueue.main.async {
                    self.coins = coinData
                    self.coinsTableView.reloadData()
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func RefrehsButton(_ sender: Any) {
       
    }
    

}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: CoinTableViewCell.self, indexPath: indexPath)
        cell.configure(coin: self.coins[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeCell(cellType: CoinTableViewCell.self, indexPath: indexPath)
        cell.DetailView.fadeIn()
    }
    
    
}


