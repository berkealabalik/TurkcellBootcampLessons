//
//  GamesCollectionViewCell.swift
//  GameScore
//
//  Created by Berke Alabalik on 6.03.2022.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var nameGame: UILabel!
    
    @IBOutlet weak var ratingReleasedLAbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.AllCorners = 10
        backgroundColor = .darkGray
        
    }

}
