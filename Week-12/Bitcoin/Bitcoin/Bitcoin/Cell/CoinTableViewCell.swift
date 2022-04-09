//
//  CoinTableViewCell.swift
//  Bitcoin
//
//  Created by Berke Alabalik on 24.03.2022.
//

import UIKit
import BitcoinAPI

class CoinTableViewCell: UITableViewCell {
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinPriceLabel: UILabel!
    @IBOutlet weak var Detail1Label: UILabel!
    @IBOutlet weak var Detail2Label: UILabel!
  
    @IBOutlet weak var DetailView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(coin : Coin){
        DetailView.isHidden = true
        coinNameLabel.text = coin.name
        let doubleprice = Double(coin.price!)
        coinPriceLabel.text = String(format : "%.2f", doubleprice!)
        preparePosterImage(with: coin.iconURL)
    }
    private func preparePosterImage(with urlString : String?) {
        
        if let url = URL(string: urlString ?? "") {
            let scale = UIScreen.main.scale
            let thumbnailSize = CGSize(width: 50 * scale, height: 50 * scale)
            coinImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"), options : .refreshCached, context: [.imageThumbnailPixelSize : thumbnailSize])
    }

}

    
}
