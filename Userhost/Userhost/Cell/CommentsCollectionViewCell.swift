//
//  CommentsCollectionViewCell.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import UIKit

class CommentsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var outerStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerStackView.layer.cornerRadius = 10
    }
    func configure(comment : CommentListElement) {
        nameLabel.text = "Name :  \(String(describing: comment.name ?? ""))"
        emailLabel.text = "Email : \(String(describing : comment.email ?? "") )"
        commentLabel.text = comment.body
    }
    
}
