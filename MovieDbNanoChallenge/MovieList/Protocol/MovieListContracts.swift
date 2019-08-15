//
//  MovieListContracts.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module View Protocol
protocol MovieListViewProtocol: class {
    // PRESENTER -> VIEW
    func showNowPlayingMovies(with movies: [Movie])
    func showPopularMovies(with movies: [Movie])
}

/// MovieList Module Presenter Protocol
protocol MovieListPresenterProtocol: class {
    // View -> Presenter
    var interactor: MovieListInputInteractorProtocol? {get set}
    var view: MovieListViewProtocol? {get set}
    var router: MovieListRouterProtocol? {get set}
    
    func viewDidLoad()
    func showMovieSelection(with movie: Movie, from view: UIViewController)
}

/// MovieList Module Presenter Protocol
protocol MovieListInputInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: MovieListOutputInteractorProtocol? {get set}
    
    func getNowPlayingMovieList()
    func getPopularMovieList()
}

/// MovieList Module Presenter Protocol
protocol MovieListOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func movieListDidFetch(movieList: [Movie])
}

/// MovieList Module Presenter Protocol
protocol MovieListRouterProtocol: class {
    // Presenter -> Router
    func pushToMovieDetail(with movie: Movie, from view: UIViewController)
    static func createMovieListModule(movieListRef: MovieListView)
}
