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
    
    private var viewModel: MovieCollectionCellViewModelProtocol? {
        didSet {
            viewModel?.movieInfoDidChanged = { [unowned self] viewModel in
                movieDescription.text = viewModel.movieDescription
                movieTitle.text = viewModel.movieTitle
                movieLogoImage.image = UIImage(data: viewModel.movieImage ?? Data())
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieLogoImage.layer.cornerRadius = 20
        viewModel = MovieCollectionCellViewModel()
    }
    
    func configureCell(with movie: Production) {
        viewModel?.configureCell(with: movie)
    }
}
