//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    private let viewModel = MovieViewModel()
    private var movies: [Production] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        activityIndicator.hidesWhenStopped = true
        getMovies()
    }
    
    private func getMovies() {
        activityIndicator.startAnimating()
        viewModel.getMovieWithDelay { movie in
            self.movies = movie.production_companies
            DispatchQueue.main.async { [weak self] in
                self?.movieCollectionView.reloadData()
            }
        }
    }
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        cell.configureCell(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

