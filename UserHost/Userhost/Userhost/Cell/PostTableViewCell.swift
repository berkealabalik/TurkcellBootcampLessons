//
//  PostTableViewCell.swift
//  Userhost
//
//  Created by Berke Alabalik on 4.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ShowButton: UIButton!
    @IBOutlet weak var postIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ShowButton.titleLabel?.textColor = .white
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
