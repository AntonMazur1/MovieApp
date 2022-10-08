//
//  MovieCollectionCellViewModel.swift
//  MovieApp
//
//  Created by Клоун on 08.10.2022.
//

import Foundation

protocol MovieCollectionCellViewModelProtocol {
    var movieImage: Data? { get }
    var movieTitle: String? { get }
    var movieDescription: String? { get }
    var movieInfoDidChanged: ((MovieCollectionCellViewModelProtocol) -> Void)? { get set }
    func configureCell(with movie: Production)
    func getMovieImage(from path: String?)
}

class MovieCollectionCellViewModel: MovieCollectionCellViewModelProtocol {
    var movieImage: Data? {
        didSet {
            movieInfoDidChanged?(self)
        }
    }
    
    var movieTitle: String? {
        didSet {
            movieInfoDidChanged?(self)
        }
    }
    
    var movieDescription: String? {
        didSet {
            movieInfoDidChanged?(self)
        }
    }
    
    var movieInfoDidChanged: ((MovieCollectionCellViewModelProtocol) -> Void)?
    
    func configureCell(with movie: Production) {
        self.movieTitle = movie.name
        self.movieDescription = movie.origin_country
        getMovieImage(from: movie.logo_path)
    }
    
    func getMovieImage(from path: String?) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + (path ?? "")) else { return }
        
        self.movieImage = try? Data(contentsOf: url)
    }
}
