//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import Foundation

protocol MovieViewModelProtocol {
    var moviesDidChanged: ((MovieViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    func getMovie()
    func getMovieCellViewModel(at indexPath: IndexPath) -> MovieCollectionCellViewModelProtocol?
}

class MovieViewModel: MovieViewModelProtocol {
    private var movies: [Production]? {
        didSet {
            moviesDidChanged?(self)
        }
    }
    
    var numberOfRows: Int {
        movies?.count ?? 0
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
    
    func getMovieCellViewModel(at indexPath: IndexPath) -> MovieCollectionCellViewModelProtocol? {
        guard let movie = movies?[indexPath.row] else { return nil }
        return MovieCollectionCellViewModel(movie: movie)
    }
}
