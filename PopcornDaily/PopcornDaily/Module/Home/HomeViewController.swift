//
//  HomeViewController.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import UIKit
protocol HomeViewControllerProtocol : AnyObject {
    func reloadData()
    func showLoading()
    func hideLoading()
    func setupSlider()
    func setupTableView()
    func setupSearchBar()
}

final class HomeViewController: BaseViewController , LoadingShowable, UISearchBarDelegate {
    let searchController = UISearchController(searchResultsController: SearchViewRouter.createModule())
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var sliderNum: UIPageControl!
    var presenter : HomePresenterProtocol!
    private var timer = Timer()
    private var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidAppear()
        sliderNum.currentPage = 0
    }
    @objc func changeImage() {
        if counter < presenter.numofItemsSlider() {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            sliderNum.currentPage = counter
            print(counter)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            sliderNum.currentPage = counter
        }
    }
}

extension HomeViewController : HomeViewControllerProtocol , UISearchControllerDelegate {
    func setupSearchBar() {
        listTableView.layer.cornerRadius = 10
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.searchTextField.borderStyle = .none
        searchController.searchBar.barTintColor = .clear
        searchController.searchBar.layer.cornerRadius = 10
        searchController.searchBar.backgroundColor = .white.withAlphaComponent(0.75)
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Whats New?"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search Movies", attributes:
                                                                                                [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        searchController.searchBar.tintColor = .red
    }
    func reloadData() {
        sliderCollectionView.reloadData()
        listTableView.reloadData()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
    }
    
    func setupSlider() {
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.register(cellType: SliderCollectionViewCell.self)
    }
    
    func setupTableView() {
        
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(cellType: TableViewCell.self)
         
    }
    

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sliderNum.numberOfPages = presenter.numofItemsSlider()
       return presenter.numofItemsSlider()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: SliderCollectionViewCell.self, indexPath: indexPath)
        cell.ConfigureSlider(movie: presenter.GetsliderMovies(indexPath.row)!)
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectRowAtSlider(index: indexPath.row)
    }
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numofItemsTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: TableViewCell.self, indexPath: indexPath)
        cell.configureTableView(movie: presenter.GettableMovies(indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(index: indexPath.row )
    }
}

extension HomeViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > 2 {
            let vc = searchController.searchResultsController as? SearchViewController
            vc?.searchWord = text
        }
    }

}
