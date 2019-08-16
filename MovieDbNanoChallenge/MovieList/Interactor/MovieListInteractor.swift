//
//  MovieListInteractor.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module Interactor
class MovieListInteractor:  MovieListInputInteractorProtocol {
    
    var presenter: MovieListOutputInteractorProtocol?
    var request = Request()
    
    func getNowPlayingMovieList(presenter: MovieListPresenter) {
        request.fetchNowPlayingMovies() { movies, error in
            guard let movies = movies, error == nil else { return }
            presenter.nowPlayingMovieListDidFetch(movieList: movies)
        }
    }
    
    func getPopularMovieList(presenter: MovieListPresenter) {
        request.fetchPopularMovies() { movies, error in
            guard let movies = movies, error == nil else { return }
            presenter.popularMovieListDidFetch(movieList: movies)
        }
    }
    
    
   
}
