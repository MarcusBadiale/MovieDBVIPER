//
//  MovieListRouter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module Router (aka: Wireframe)
class MovieListRouter: MovieListRouterProtocol {
    
    func pushToMovieDetail(with movie: Movie, from view: UIViewController) {
        let movieDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "MovieDetailView") as! MovieDetailView
        let presenter = MovieDetailPresenter()
        MovieDetailRouter.createMovieDetailModule(movieDetailRef: presenter, controller: movieDetailViewController, movie: movie)
        movieDetailViewController.presenter = presenter
//        movieDetailViewController.movi
        view.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
    func pushToNowPlaying(with movies: [Movie], from view: UIViewController) {
        let nowPlayingViewController = view.storyboard?.instantiateViewController(withIdentifier: "NowPlayingView") as! MovieSearchView
        let presenter = MovieSearchPresenter()
        MovieSearchRouter.createMovieSearchModule(movieDetailRef: presenter, controller: nowPlayingViewController, movies: movies)
        
        view.navigationController?.pushViewController(nowPlayingViewController, animated: true)
    }
    
    class func createMovieListModule(movieListRef: MovieListView) {
        
        let presenter: MovieListPresenterProtocol & MovieListOutputInteractorProtocol = MovieListPresenter()
        
        movieListRef.presenter = presenter
        movieListRef.presenter?.router = MovieListRouter()
        movieListRef.presenter?.view = movieListRef
        movieListRef.presenter?.interactor = MovieListInteractor()
        movieListRef.presenter?.interactor?.presenter = presenter
    }
}
