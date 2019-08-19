//
//  MovieListContracts.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module View Protocol
protocol MovieDetailViewProtocol: class {
    // PRESENTER -> VIEW
    func showGenres(genres: String)
}

/// MovieList Module Presenter Protocol
protocol MovieDetailPresenterProtocol: class {
    // View -> Presenter
    var interactor: MovieDetailInputInteractorProtocol? {get set}
    var view: MovieDetailViewProtocol? {get set}
    var router: MovieDetailRouterProtocol? {get set}
    
    func viewDidLoad()
}

/// MovieList Module Presenter Protocol
protocol MovieDetailInputInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: MovieDetailOutputInteractorProtocol? {get set}
    
    func getMovieDetails(presenter: MovieDetailPresenter)
}

/// MovieList Module Presenter Protocol
protocol MovieDetailOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func movieGenresDidFetch(genres: [Genre])
}

/// MovieList Module Presenter Protocol
protocol MovieDetailRouterProtocol: class {
    // Presenter -> Router
    func pushToMovieList(with movie: Movie, from view: UIViewController)
    static func createMovieDetailModule(movieDetailRef: MovieDetailPresenter?, controller: MovieDetailView, movie: Movie)
}
