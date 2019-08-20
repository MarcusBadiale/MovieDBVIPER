//
//  MovieDetailView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module View
class MovieDetailView: UIViewController, MovieDetailViewProtocol {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var loadingGenreIndicator: UIActivityIndicatorView!
    
    var movieGenresText = "Loading genres..." {
        didSet {
            guard let label = movieGenres else { return }
            DispatchQueue.main.async {
                self.loadingGenreIndicator.isHidden = true
                label.text = self.movieGenresText
            }
        }
    }
    
    var presenter: MovieDetailPresenterProtocol?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupMovie(movie: self.movie!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        movieGenres.text = movieGenresText
        loadingGenreIndicator.isHidden = false
    }
    
    func setupMovie(movie: Movie) {
        
        movieTitle.text = movie.title
        movieRating.text = "\(movie.rating ?? 10.0)"
        movieDescription.text = movie.overview
        
        DispatchQueue.global(qos: .background).async {
            if let url = movie.imageURL, let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.movieImage.image = image
                }
            }
        }

    }

    func showGenres(genres: String) {
//        DispatchQueue.main.async {
        self.movieGenresText = genres
        
//        }
    }
}


