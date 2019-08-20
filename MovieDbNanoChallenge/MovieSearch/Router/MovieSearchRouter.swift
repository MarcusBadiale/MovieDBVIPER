//
//  MovieSearchRouter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieSearch Module Router (aka: Wireframe)
class MovieSearchRouter: MovieSearchRouterProtocol {
    
    func pushToMovieDetail(with movie: Movie, from view: UIViewController) {
        let movieDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "MovieDetailView") as! MovieDetailView
        let presenter = MovieDetailPresenter()
        MovieDetailRouter.createMovieDetailModule(movieDetailRef: presenter, controller: movieDetailViewController, movie: movie)
        movieDetailViewController.presenter = presenter
        view.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
    
    static func createMovieSearchModule(movieDetailRef: MovieSearchPresenter?, controller: MovieSearchView, movies: [Movie]) {
        
        movieDetailRef?.presenter = movieDetailRef
        movieDetailRef?.router = MovieSearchRouter()
        movieDetailRef?.view = controller
        movieDetailRef?.interactor = MovieSearchInteractor()
        movieDetailRef?.interactor?.presenter = movieDetailRef
        movieDetailRef?.movies = movies
        controller.presenter = movieDetailRef
    }
    
}
