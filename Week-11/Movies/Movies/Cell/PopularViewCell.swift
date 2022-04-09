//
//  PopularViewCell.swift
//  Movies
//
//  Created by Berke Alabalik on 19.03.2022.
//

import UIKit
import MoviesAPI
import SDWebImage
class PopularViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(movie : Movie){
        preparePosterImage(with: movie.posterPath)
        titleLabel.text = movie.title
    }
    
    private func preparePosterImage(with urlString : String?) {
        let fullPath = "https://image.tmdb.org/t/p/w200\(urlString ?? "")"
    
    
    if let url = URL(string: fullPath) {
        movieImage.sd_setImage(with: url, completed: nil)
    }

}

}
