//
//  MovieListPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module Presenter
class MovieListPresenter: MovieListPresenterProtocol {
    
    
    var interactor: MovieListInputInteractorProtocol?
    var router: MovieListRouterProtocol?
    var view: MovieListViewProtocol?
    var presenter: MovieListPresenterProtocol?
    var name: String = ""
    
    func viewDidLoad() {
        interactor?.getNowPlayingMovieList(presenter: self)
        interactor?.getPopularMovieList(presenter: self)
//        interactor?.getSearchMovieList(presenter: self)
    }
    
    func showMovieSelection(with movie: [Movie], from view: UIViewController) {
        
    }
    
    func sendSearchText(with name: String) {
        self.name = name
        interactor?.getSearchMovieList(presenter: self)
    }

}

// MARK: - extending MovieListPresenter to implement it's protocol
extension MovieListPresenter: MovieListOutputInteractorProtocol {
    
    func searchMoviesDidFetch(movieList: [Movie]) {
        view?.showSearchMovies(with: movieList)
    }
    
    
    func nowPlayingMovieListDidFetch(movieList: [Movie]) {
        view?.showNowPlayingMovies(with: movieList)
    }
    
    func popularMovieListDidFetch(movieList: [Movie]) {
        view?.showPopularMovies(with: movieList)
    }
    
    
}
