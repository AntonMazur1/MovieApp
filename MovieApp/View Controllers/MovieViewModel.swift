//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import Foundation

class MovieViewModel {
    func getMovieWithDelay(completion: @escaping(Movie) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let url = "https://api.themoviedb.org/3/movie/550?api_key=e27577e904808c66e4790378ff105a67"
            NetworkManager.getMovies(url: url) { (result: Result<Movie, MovieError>) in
                switch result {
                case .success(let data):
                    completion(data)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
