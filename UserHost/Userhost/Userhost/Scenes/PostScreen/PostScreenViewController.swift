//
//  PostScreenViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 3.04.2022.
//

import UIKit

class PostScreenViewController: UIViewController {
    var viewModel : PostScreenModelProtocol?
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var PostsTableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.layer.cornerRadius = 10
        viewModel?.delegate = self
        PostsTableView.register(cellType: PostTableViewCell.self)
    }
}
extension PostScreenViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.filteredPosts?.count ?? 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: PostTableViewCell.self, indexPath: indexPath)
        textLabel.text = String(viewModel?.selectedUserVC?.username ?? "") + ", Has Opened " + String(viewModel?.filteredPosts?.count ?? 5) + " Posts."
        cell.TitleLabel.text = viewModel?.filteredPosts?[indexPath.row].title
        cell.postIdLabel.text! = "Post ID : " + String(viewModel?.filteredPosts?[indexPath.row].id ?? 0)
        cell.ShowButton.titleLabel?.textColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPostDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PostDetailScreenViewController , let indexPath = sender as? IndexPath {
            let vm = PostDetailScreenModel(post: (viewModel?.filteredPosts?[indexPath.row])!, user: (viewModel?.selectedUserVC)!)
            controller.viewModel = vm
        }
    }
}
extension PostScreenViewController : PostScreenDelegate {
    func InformTable() {
        PostsTableView.reloadData()
    }
}
