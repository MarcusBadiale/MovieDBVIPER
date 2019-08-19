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
    
    static func createMovieDetailModule(movieDetailRef: MovieDetailView, movie: Movie) {
        
        let presenter: MovieDetailPresenterProtocol & MovieDetailOutputInteractorProtocol = MovieDetailPresenter()
        
        movieDetailRef.presenter = presenter
        movieDetailRef.presenter?.router = MovieDetailRouter()
        movieDetailRef.presenter?.view = movieDetailRef
        movieDetailRef.presenter?.interactor = MovieDetailInteractor()
        movieDetailRef.presenter?.interactor?.presenter = presenter
        movieDetailRef.movie = movie
    }
    
    
}
