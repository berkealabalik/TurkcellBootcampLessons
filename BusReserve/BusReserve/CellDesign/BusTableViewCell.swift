//
//  BusTableViewCell.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import UIKit

class BusTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var fiyatLabel: UILabel?
    @IBOutlet weak var saatLabel: UILabel?
    @IBOutlet weak var tarihLabel: UILabel?
    @IBOutlet weak var Busimage: UIImageView?
    @IBOutlet weak var tarihAy: UILabel!
    @IBOutlet weak var saatMinute: UILabel!
    @IBOutlet weak var secBtn: UIButton?
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
   
    
}

