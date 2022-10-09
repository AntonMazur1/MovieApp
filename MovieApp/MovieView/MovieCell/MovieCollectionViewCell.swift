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
    
    var viewModel: MovieCollectionCellViewModelProtocol? {
        didSet {
            movieDescription.text = viewModel?.movieDescription
            movieTitle.text = viewModel?.movieTitle
            guard let imageData = viewModel?.movieImage else { return }
            movieLogoImage.image = UIImage(data: imageData)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieLogoImage.layer.cornerRadius = 20
    }
}
