//
//  SearchViewController.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 27.04.2022.
//

import UIKit
protocol SearchViewControllerProtocol : AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func configureData()
    func getSearchWord() -> String?
    var searchWord : String? { get set }
}

final class SearchViewController: BaseViewController , LoadingShowable{
    @IBOutlet weak var searchTableView: UITableView!
    var presenter : SearchViewPresenterProtocol?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    private func configureTable() {
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
        
        self.searchTableView.register(cellType: SearchViewTableViewCell.self)
    }
    var searchWord: String? {
        didSet {
            presenter?.searchMovie(word: searchWord ?? "")
        }
    }
}

extension SearchViewController : SearchViewControllerProtocol {
    func getSearchWord() -> String? {
        searchWord
    }
    func reloadData() {
        searchTableView.reloadData()
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func configureData() {
        configureTable()
    }
}

extension SearchViewController :  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: SearchViewTableViewCell.self, indexPath: indexPath)
        cell.configureView(movie: presenter!.searchMoviesInformation(indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
 
}
