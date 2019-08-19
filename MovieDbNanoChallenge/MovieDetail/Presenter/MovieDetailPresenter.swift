//
//  MovieDetailPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module Presenter
class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    var interactor: MovieDetailInputInteractorProtocol?
    var view: MovieDetailViewProtocol?
    var router: MovieDetailRouterProtocol?
    var presenter: MovieDetailPresenterProtocol?
    
    var movieId: Int?
    
    func viewDidLoad() {
        interactor?.getMovieDetails(presenter: self)
    }
    

}

extension MovieDetailPresenter: MovieDetailOutputInteractorProtocol {
    func movieGenresDidFetch(genres: [Genre]){
    
        let result = genres.compactMap { $0.name }.joined(separator: ", ")
        
        view?.showGenres(genres: result)
    }

}
