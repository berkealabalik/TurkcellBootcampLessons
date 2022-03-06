//
//  HeaderCollectionReusableView.swift
//  GameScore
//
//  Created by Berke Alabalik on 6.03.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    let Headerlayout = UICollectionViewFlowLayout()
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "Header Section"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    public func configureHeader(){
        backgroundColor = .systemGreen
        addSubview(label)
        Headerlayout.scrollDirection = .horizontal
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
        
    }
        
}
