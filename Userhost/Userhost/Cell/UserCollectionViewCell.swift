//
//  UserCollectionViewCell.swift
//  Userhost
//
//  Created by Berke Alabalik on 3.04.2022.
//

import UIKit

import UIKit
class UserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var StackViewTop: UIStackView!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var OuterView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func ConfigureCell(user : UserListElement?) {
        NameLabel.text = user?.name
        userNameLabel.text = ": " + "\(user?.username! ?? "")"
        
    }
}



