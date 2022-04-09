//
//  ViewModel.swift
//  Movies
//
//  Created by Berke Alabalik on 25.03.2022.
//
// VİEW MODEL UIKİT OLMAZ . KURAL 2 View Controller movies apı tutulmaz .
import Foundation
import MoviesAPI

extension ViewModel {
    fileprivate enum Constants {
        static let cellTitleHeight : Double = 50
        static let cellPosterImageRatio : Double = 1/2
        static let cellLeftPadding : Double = 15
        static let cellRightPadding : Double = 15
    }
}

protocol ViewModelProtocol { // Protocol ise veri gelirken diğer yerden
    var delegate :ViewModelDelegate? { get set}
    var numberOfItems : Int { get }
    var cellPadding : Double  { get }
    func load()
    func movie(index : Int) -> Movie?
    func calculateCellHeight(collectionViewWidth : Double) -> (width : Double , height :Double)
    
}

protocol ViewModelDelegate : AnyObject { // delegate haber gönderiyor .
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
}

final class ViewModel {
    // let service : MovieServiceProtocol = PopularMoviesService() Alttaki farklı yaklaşım
    let service : MovieServiceProtocol
    private var movies : [Movie] = []
    weak var delegate :ViewModelDelegate? // Delegate Burda Tanımladık
    // Weak var çünkü anyobject dedik .
    init(service :MovieServiceProtocol) {
        self.service = service
    }
    
    
    fileprivate func fetchMovies() {
        //showLoading() // Loading görsel bir öğe viewcontroller bağalr .
        // BURADA İSE DELEGATELER İLE HABER VERCEZ VİEWCONTROLLERA LOADİNG GÖSTERMESİNİ SÖYLE -> DELEGATE!!! en az şu an 3 delegate var .
        self.delegate?.showLoadingView()
        service.fetchPopularMovies { [weak self] response in
            guard let self = self else { return }
            //self.hideLoading()
            self.delegate?.hideLoadingView()
            switch response {
            case .success(let movies):
                self.movies = movies
                //self.collectionView.reloadData() // DELEGATE İLE HABER GÖNDER RELOAD DATA YAPSIN .
                self.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewModel : ViewModelProtocol {
    func movie(index: Int) -> Movie? {
        movies[index] // SAFE crash olmasın diye BAK!!!!
    }
    
    var numberOfItems: Int {
        movies.count
    }
    
    var cellPadding: Double {
        Constants.cellLeftPadding
    }
    
    func load() {
        fetchMovies()
    }
    
    func calculateCellHeight(collectionViewWidth: Double) -> (width: Double, height: Double) {
        let cellWidth = collectionViewWidth - (Constants.cellLeftPadding + Constants.cellRightPadding)
        let posterImageHeight = cellWidth * Constants.cellPosterImageRatio
        return (width : cellWidth , height : Constants.cellTitleHeight * posterImageHeight)
    }
    
    
}
