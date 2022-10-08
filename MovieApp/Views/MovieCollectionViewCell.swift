//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCell"
    
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieLogoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieLogoImage.layer.cornerRadius = 20
    }
    
    func configureCell(with movie: Production) {
        movieTitle.text = movie.name
        movieDescription.text = movie.origin_country
    }
}
