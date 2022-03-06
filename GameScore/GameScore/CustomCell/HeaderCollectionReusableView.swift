//
//  HeaderCollectionReusableView.swift
//  GameScore
//
//  Created by Berke Alabalik on 6.03.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView , UICollectionViewDelegateFlowLayout {
    
    let layout = UICollectionViewFlowLayout()
    

    @IBOutlet weak var gameNameHeader: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        layout.scrollDirection = .vertical
        
        
        outerView.backgroundColor = .purple
        
        headerImage.AllCorners = 20
        
        
    }
    
}
