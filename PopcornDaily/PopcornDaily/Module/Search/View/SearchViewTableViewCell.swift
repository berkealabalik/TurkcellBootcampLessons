//
//  SearchViewTableViewCell.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 28.04.2022.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    @IBOutlet weak var filmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configureView(movie : SearchedMovies){
        filmLabel.text = (movie.title ?? "" ) + "(" + (movie.releaseDate?.prefix(4) ?? "") + ")"
        
    }
    
}
