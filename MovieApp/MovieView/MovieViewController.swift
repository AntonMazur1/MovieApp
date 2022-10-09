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
    
    private var viewModel: MovieViewModelProtocol! {
        didSet {
            viewModel?.moviesDidChanged = { [unowned self] viewModel in
                DispatchQueue.main.async { [unowned self] in
                    movieCollectionView.reloadData()
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        viewModel = MovieViewModel()
        viewModel.getMovie()
    }
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.viewModel = viewModel.getMovieCellViewModel(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: movieCollectionView.frame.width * 0.4, height: movieCollectionView.frame.height)
    }
}

