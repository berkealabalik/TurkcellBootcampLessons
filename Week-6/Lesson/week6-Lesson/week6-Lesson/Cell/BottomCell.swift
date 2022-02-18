//
//  BottomCell.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import UIKit

class BottomCell: UICollectionViewCell,EDevletCellProtocol {
    static var reuseIdentifier: String = "BottomCell"
    
    let containerView = UIView()
    let imageView = UIImageView()
    let title = UILabel()
    let subTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.font = .preferredFont(forTextStyle: .headline)
        title.textColor = .label
        title.numberOfLines = 0
        
        subTitle.font = .preferredFont(forTextStyle: .subheadline)
        subTitle.textColor = .secondaryLabel
        subTitle.numberOfLines = 0
        
        let innerstackView = UIStackView(arrangedSubviews: [title,subTitle])
        innerstackView.axis = .vertical
        let outerStackView = UIStackView(arrangedSubviews: [imageView , innerstackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.spacing = 10
        
        contentView.addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        
        
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name ?? ""
        subTitle.text = edevlet?.subheading ?? ""
        imageView.image = UIImage(named: edevlet?.image ?? "e-devlet_logo")
    }
    
    
}
