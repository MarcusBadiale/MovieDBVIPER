//
//  MovieSearchPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieSearch Module Presenter
class MovieSearchPresenter: MovieSearchPresenterProtocol {
    
    var interactor: MovieSearchInputInteractorProtocol?
    var view: MovieSearchViewProtocol?
    var router: MovieSearchRouterProtocol?
    var presenter: MovieSearchPresenterProtocol?
    
    var movies: [Movie]?
    
    func viewDidLoad() {
        view?.showMovies(movies: movies!)
    }
    
}

extension MovieSearchPresenter: MovieSearchOutputInteractorProtocol {
    
}
