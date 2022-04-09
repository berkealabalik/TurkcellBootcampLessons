//
//  ViewController.swift
//  Movies
//
//  Created by Berke Alabalik on 19.03.2022.
//

import UIKit


class ViewController: UIViewController , LoadingShowable {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel : ViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(cellType: PopularViewCell.self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.load()
    }
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: PopularViewCell.self, indexPath: indexPath)
        if let movie = viewModel.movie(index: indexPath.row) {
            cell.configure(movie : movie)
        }
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: viewModel.calculateCellHeight(collectionViewWidth: collectionView.frame.size.width).width, height: viewModel.calculateCellHeight(collectionViewWidth: collectionView.frame.size.width).height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: .zero, left: viewModel.cellPadding, bottom: 0, right: viewModel.cellPadding)
    }
}


extension ViewController : ViewModelDelegate {
    func showLoadingView() {
        showLoadingView()
    }
    
    func hideLoadingView() {
        hideLoadingView()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    
}
