//
//  MovieCollectionCellViewModel.swift
//  MovieApp
//
//  Created by Клоун on 08.10.2022.
//

import Foundation

protocol MovieCollectionCellViewModelProtocol {
    var movieTitle: String { get }
    var movieDescription: String { get }
    var movieImage: Data? { get }
    init(movie: Production)
}

class MovieCollectionCellViewModel: MovieCollectionCellViewModelProtocol {
    var movieImage: Data? {
        NetworkManager.getImage(url: movie.logo_path ?? "")
    }
    
    var movieTitle: String {
        movie.name
    }
    
    var movieDescription: String {
        movie.origin_country
    }
    
    private var movie: Production
    
    required init(movie: Production) {
        self.movie = movie
    }
}
