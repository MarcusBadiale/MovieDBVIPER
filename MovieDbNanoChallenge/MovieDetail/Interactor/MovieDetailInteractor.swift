//
//  MovieDetailInteractor.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module Interactor
class MovieDetailInteractor: MovieDetailInputInteractorProtocol {
    
    var presenter: MovieDetailOutputInteractorProtocol?
    var request = Request()
    
    func getMovieDetails(presenter: MovieDetailPresenter) {
        request.fetchMovieGenres(movieId: presenter.movie?.id ?? 25) { genres, error in
            guard let genres = genres, error == nil else { return }
            presenter.movieGenresDidFetch(genres: genres)
            
        }
    }
    
}
