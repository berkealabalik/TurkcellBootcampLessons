//
//  HighlightCell.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import UIKit

class HighlightCell: UICollectionViewCell,EDevletCellProtocol {
    static var reuseIdentifier: String = "HighlightedCell"
    
    let containerView = UIView()
    let imageView = UIImageView()
    let title = UILabel()
    let subTitle = UILabel()
   
    
    override init(frame: CGRect) { // burası ise özelleştirmeler renk burda
        super.init(frame: frame)
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false // BÜYÜK TAMIC YAZDIM . Tasarımı oluştururken sağ 20 birim sol 10 birim uzakta olsun özellikleri kullanabilmek için
        
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        title.numberOfLines = 0 // kesmesin satır diye
        
        subTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subTitle.textColor = .secondaryLabel
        subTitle.numberOfLines = 0
        
        // Image ve yazı altlı üstlü olsun istiyoruz .
        
        let innerStackView = UIStackView(arrangedSubviews: [title,subTitle])
        let OuterStackView = UIStackView(arrangedSubviews: [imageView,innerStackView])
        OuterStackView.axis = .horizontal
        innerStackView.axis = .vertical // dikey sıralansın vertical
        
        OuterStackView.translatesAutoresizingMaskIntoConstraints = false
        OuterStackView.spacing = 10 // ürünler arası boşluk .
        
        containerView.addSubview(OuterStackView)
        
        // AUTO LAYOUT
        NSLayoutConstraint.activate([
            OuterStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), // custom cell soluyla eşitlensin ==sola sıfır .
            OuterStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), //sağdan
            OuterStackView.topAnchor.constraint(equalTo: contentView.topAnchor) // üst
            // bir yerin spacingi özel olarak vermek istiyorsak
            
        ]) // soldan sağdan alttan üstten komşuları ile ilişisini belirten array
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) { // modelden gelen data basılır ama titlede ne yazacak burdan verilecek
        title.text = edevlet?.name ?? ""
        subTitle.text = edevlet?.subheading ?? ""
        imageView.image = UIImage(systemName: "star") // Resim eklenince değiştir
        
    }
    
    
    
}
