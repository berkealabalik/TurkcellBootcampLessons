//
//  PostCommentViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import UIKit

class PostCommentViewController: UIViewController {
    var viewModel : PostCommentModelProtocol?
    @IBOutlet weak var commentsCollectionView: UICollectionView!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var commentStackView: UIStackView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        commentStackView.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        commentsCollectionView.register(cellType: CommentsCollectionViewCell.self)
    }
}
extension PostCommentViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postLabel.text = "Post Have " + String(viewModel?.FilteredComments?.count ?? 5) + " Comments."
        return viewModel?.FilteredComments?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: CommentsCollectionViewCell.self, indexPath: indexPath)
        cell.configure(comment: (viewModel?.FilteredComments![indexPath.row])!)
        return cell
    }
}
extension PostCommentViewController : PostCommentDelegate {
    func reloadTable() {
        self.commentsCollectionView.reloadData()
    }
}
