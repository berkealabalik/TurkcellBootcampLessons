//
//  MovieDetailViewController.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 26.04.2022.
//

import UIKit
import Kingfisher
import SwiftUI
import Lottie
protocol MovieDetailViewControllerProtocol : AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func getMovieId() -> String?
    func configureData()
}

final class MovieDetailViewController: UIViewController , LoadingShowable{
    var presenter : MovieDetailPresenterProtocol!
    var MovieID : Int?
    
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var scrollview: UIScrollView!
    @IBOutlet private weak var similarCollectionView: UICollectionView!
    @IBOutlet private weak var RelaseDateLabel: UILabel!
    @IBOutlet private weak var MovieImageView: UIImageView!
    @IBOutlet private weak var MovieTitleLabel: UILabel!
    @IBOutlet private weak var heartFavoriteAnimation: AnimationView!
    @IBOutlet private weak var MovieDescriptionLabel: UILabel!
    @IBOutlet private weak var descriptionBackground: UIView!
    @IBOutlet private weak var PointLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        self.navigationController?.view.backgroundColor = .clear
    }
    @IBAction func heartButton(_ sender: Any) {
        heartFavoriteAnimation.loopMode = .playOnce
        heartFavoriteAnimation.animationSpeed = 1
        heartFavoriteAnimation.play()
    }
    @IBAction func imdbButton(_ sender: Any) {
        presenter.didpressButton(imdb: presenter.movieSelected(0).imdbID!)
    }
    private func configureLabels() {
        descriptionBackground.layer.cornerRadius = 5
        scrollview.contentSize = CGSize(width: 0,height: self.view.frame.height * 2)
        similarCollectionView.register(cellType: SimilarMoviesCollectionViewCell.self)
        
        RelaseDateLabel.text = presenter.movieSelected(0).releaseDate ?? ""
        MovieTitleLabel.text = (presenter.movieSelected(0).originalTitle ?? "")
        overviewLabel.text = (presenter.movieSelected(0).tagline ?? "")
        MovieDescriptionLabel.text = presenter.movieSelected(0).overview
        PointLabel.text = String(presenter.movieSelected(0).voteAverage ?? 0.0)
        let stringurl = "https://image.tmdb.org/t/p/original" + (presenter.movieSelected(0).posterPath ?? "")
        let url = URL(string : stringurl)
        MovieImageView.kf.setImage(with: url, options: [.cacheOriginalImage,.transition(.fade(1))])
    }
}

extension MovieDetailViewController : MovieDetailViewControllerProtocol {
    func configureData() {
        configureLabels()
    }
    
    func getMovieId() -> String? {
        let movieIDString = String(MovieID!)
        return movieIDString
    }
    
    func reloadData() {
        similarCollectionView.reloadData()
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
}

extension MovieDetailViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.similarMovieNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: SimilarMoviesCollectionViewCell.self, indexPath: indexPath)
        cell.configureSimilar(movies: presenter.similarMovies(indexPath.row))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 4 , height: similarCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didpressSimilarMovie(index: indexPath.row)
    }
}
