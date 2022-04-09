//
//  PostDetailScreenViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 4.04.2022.
//

import UIKit

class PostDetailScreenViewController: UIViewController {
    var viewModel : PostDetailScreenModelProtocol?
    @IBOutlet weak var OuterView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        OuterView.layer.cornerRadius = 10
        ConfigureView()
    }
    private func ConfigureView(){
        OuterView.layer.cornerRadius = 10
        titleLabel.text = viewModel?.PostSelectedVC?.title
        textsLabel.text = viewModel?.PostSelectedVC?.body
    }
    @IBAction func showComments(_ sender: Any) {
        performSegue(withIdentifier: "showComments", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PostCommentViewController {
            let vm = PostCommentModel(post: (viewModel?.PostSelectedVC)!, user: (viewModel?.UserSelectedVC)!)
            controller.viewModel = vm
        }
    }
}
