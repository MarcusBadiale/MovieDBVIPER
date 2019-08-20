//
//  MovieSearchView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieSearch Module View
class MovieSearchView: UIViewController, MovieSearchViewProtocol {
    
    @IBOutlet weak var fullNowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var numberOfResults: UILabel!
    
    var presenter: MovieSearchPresenterProtocol?
    var movies: [Movie] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewDidLoad()
        fullNowPlayingCollectionView.delegate = self
        fullNowPlayingCollectionView.dataSource = self
        
        numberOfResults.text = "Showing \(movies.count) results"
        
//        navigationItem.backBarButtonItem?.title
    }
    
    func showMovies(movies: [Movie]) {
        self.movies = movies
    }
    
}

extension MovieSearchView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.router?.pushToMovieDetail(with: movies[indexPath.row], from: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCollectionCell", for: indexPath) as! NowPlayingCollectionViewCell
        
        let movie = movies[indexPath.row]
        
        cell.movieTitle.text = movie.title
        cell.movieRating.text = "\(movie.rating!)"
        
        DispatchQueue.global(qos: .background).async {
            if let url = movie.imageURL, let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    cell.movieImage.image = image
                }
            }
        }
        
        return cell
    }
    
    
}
