//
//  TopCell.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import UIKit

class TopCell: UICollectionViewCell, EDevletCellProtocol {
    static var reuseIdentifier: String = "TopCell"
    
    let containerView = UIView() // sürükle bıraktan farklı birşey değil .
    let imageView = UIImageView()
    let title = UILabel()
    let seperator = UIView(frame : .zero)
    
    // ÖDEV: super init neden kullanılır ne işe yarar?
    override init(frame: CGRect) { // burası ise özelleştirmeler renk burda
        super.init(frame: frame)
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false // BÜYÜK TAMIC YAZDIM . Tasarımı oluştururken sağ 20 birim sol 10 birim uzakta olsun özellikleri kullanabilmek için
        
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .green
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        
        // Image ve yazı altlı üstlü olsun istiyoruz .
        let stackView = UIStackView(arrangedSubviews: [seperator,imageView,title])
        stackView.axis = .vertical // dikey sıralansın vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading // sola dayalı yazılar ve resim . başlangıç noktası sola dayalı
        stackView.spacing = 10 // ürünler arası boşluk .
        
        
        containerView.addSubview(stackView)
        
        // AUTO LAYOUT
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 1),// ince bir çizgi 1
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), // custom cell soluyla eşitlensin
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), //sağdan
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor) // üst
            // bir yerin spacingi özel olarak vermek istiyorsak
            
        ]) // soldan sağdan alttan üstten komşuları ile ilişisini belirten array
        stackView.setCustomSpacing(20, after: seperator) // seperator sonra 10 vercen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) { // modelden gelen data basılır ama titlede ne yazacak burdan verilecek
        title.text = edevlet?.name ?? ""
        imageView.image = UIImage(systemName: "star") // Resim eklenince değiştir
        
    }
    
    
    
}
