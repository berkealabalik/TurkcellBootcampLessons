//
//  TableViewCell.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 25.04.2022.
//

import UIKit
import Kingfisher
final class TableViewCell: UITableViewCell {

    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureTableView(movie : ResultMovies) {
        titleLabel.text = movie.originalTitle ?? ""
        movieDescriptionLabel.text = movie.overview ?? ""
        movieDateLabel.text = movie.releaseDate ?? ""
        let stringurl = "https://image.tmdb.org/t/p/original" + (movie.posterPath ?? "")
        let url = URL(string : stringurl)
        posterImageView.kf.setImage(with: url)
        posterImageView.kf.indicatorType = .activity
        
        
    }
    
}
