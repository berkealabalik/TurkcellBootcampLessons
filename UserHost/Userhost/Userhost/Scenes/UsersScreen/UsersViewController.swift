//
//  UsersViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 2.04.2022.
//

import UIKit

class UsersViewController: UIViewController {
    private var viewModel : UsersViewModelProtocol = UsersViewModel()
    @IBOutlet weak var usersCollectionView: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserList()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        usersCollectionView.register(cellType: UserCollectionViewCell.self)
    }
    @objc func callDetailScreen(sender : UIButton) {
        performSegue(withIdentifier: "showUserDetail", sender: sender.tag)
    }
}
extension UsersViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.Users?.count ?? 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: UserCollectionViewCell.self, indexPath: indexPath)
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(callDetailScreen(sender: )), for: .touchUpInside)
        cell.ConfigureCell(user: viewModel.Users?[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPosts", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let control = segue.destination as? PostScreenViewController , let indexPath = sender as? IndexPath {
            let vm = PostScreenModel(user: viewModel.Users![indexPath.row])
            control.viewModel = vm
        }
        else if let controller = segue.destination as? UserDetailViewController , let indexPath = sender as? Int {
            let vm = UserInformationModel(usr : viewModel.Users![indexPath])
            controller.viewModel = vm
        }
    }
}
extension UsersViewController : UsersViewModelDelegate {
    func InformTable() {
        usersCollectionView.reloadData() // Data Fetched Reload Table
    }
}

