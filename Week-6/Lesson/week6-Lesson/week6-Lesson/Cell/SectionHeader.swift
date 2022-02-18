//
//  SectionHeader.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import UIKit // BU REUSABLE VİEW DİĞERLERİ CELL.

class SectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeader"
    
    let title = UILabel()
    let seperator = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        seperator.backgroundColor = .green
        seperator.translatesAutoresizingMaskIntoConstraints = false
        
        title.textColor = .label
        title.font = .preferredFont(forTextStyle: .headline)
        
        let stackView = UIStackView(arrangedSubviews: [seperator, title])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            
            seperator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor), // stackview de oldugu için view yok .
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        //Bottom için kontrol et
        
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
