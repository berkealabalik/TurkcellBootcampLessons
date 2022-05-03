//
//  SliderCollectionViewCell.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 25.04.2022.
//

import UIKit
import Kingfisher

final class SliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var sliderImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func ConfigureSlider(movie : ResultMovies) {
        let stringurl = "https://image.tmdb.org/t/p/original" + (movie.posterPath ?? "")
        let url = URL(string : stringurl)
        sliderImage.kf.setImage(with: url, options: [.cacheOriginalImage,.transition(.fade(1))])
        movieTitle.text = (movie.originalTitle ?? "") + " (" + (movie.releaseDate?.prefix(4) ?? "") + ")"
    }
}
