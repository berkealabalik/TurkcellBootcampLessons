//
//  SimilarMoviesCollectionViewCell.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 26.04.2022.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var similarMoviesImageView: UIImageView!
    @IBOutlet weak var similarMovieNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        similarMoviesImageView.layer.cornerRadius = 10
    }
    func configureSimilar(movies : SimilarMovieDetail) {
        similarMovieNameLabel.text = (movies.title ?? "")
        dateLabel.text = "(" +  (movies.releaseDate?.prefix(4) ?? "") + ")"
        let stringurl = "https://image.tmdb.org/t/p/original" + (movies.posterPath ?? "")
        let url = URL(string : stringurl)
        similarMoviesImageView.kf.setImage(with: url, options: [.cacheOriginalImage,.transition(.fade(1))])
    }

}
