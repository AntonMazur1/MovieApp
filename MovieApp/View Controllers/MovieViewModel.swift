//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import Foundation

protocol MovieViewModelProtocol {
    var movies: [Production]? { get set }
    var moviesDidChanged: ((MovieViewModelProtocol) -> Void)? { get set }
    func getMovie()
}

class MovieViewModel: MovieViewModelProtocol {
    var movies: [Production]? {
        didSet {
            moviesDidChanged?(self)
        }
    }
    
    var moviesDidChanged: ((MovieViewModelProtocol) -> Void)?
    
    func getMovie() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let url = "https://api.themoviedb.org/3/movie/550?api_key=e27577e904808c66e4790378ff105a67"
            NetworkManager.getMovies(url: url) { [unowned self] (result: Result<Movie, MovieError>) in
                switch result {
                case .success(let data):
                    movies = data.production_companies
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
