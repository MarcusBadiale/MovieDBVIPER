//
//  MovieDetailRouter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    func pushToMovieList(with movie: Movie, from view: UIViewController) {
        
    }
    
    static func createMovieDetailModule(movieDetailRef: MovieDetailPresenter?, controller: MovieDetailView, movie: Movie) {
        
        movieDetailRef?.presenter = movieDetailRef
        movieDetailRef?.router = MovieDetailRouter()
        movieDetailRef?.view = MovieDetailView()
        movieDetailRef?.interactor = MovieDetailInteractor()
        movieDetailRef?.interactor?.presenter = movieDetailRef
        movieDetailRef?.movie = movie
        controller.movie = movieDetailRef?.movie
    }
    
    
}
