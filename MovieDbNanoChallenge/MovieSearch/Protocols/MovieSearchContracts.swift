//
//  MovieSearchContracts.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module View Protocol
protocol MovieSearchViewProtocol: class {
    // PRESENTER -> VIEW
    func showMovies(movies: [Movie])
}

/// MovieList Module Presenter Protocol
protocol MovieSearchPresenterProtocol: class {
    // View -> Presenter
    var interactor: MovieSearchInputInteractorProtocol? {get set}
    var view: MovieSearchViewProtocol? {get set}
    var router: MovieSearchRouterProtocol? {get set}
    
    func viewDidLoad()
}

/// MovieList Module Presenter Protocol
protocol MovieSearchInputInteractorProtocol: class {
    // Presenter -> Interactor
    
    var presenter: MovieSearchOutputInteractorProtocol? {get set}
    
}

/// MovieList Module Presenter Protocol
protocol MovieSearchOutputInteractorProtocol: class {
    // Interactor -> Presenter
    
}

/// MovieList Module Presenter Protocol
protocol MovieSearchRouterProtocol: class {
    // Presenter -> Router
    func pushToMovieDetail(with movie: Movie, from view: UIViewController)
    static func createMovieSearchModule(movieDetailRef: MovieSearchPresenter?, controller: MovieSearchView, movies: [Movie])
}

