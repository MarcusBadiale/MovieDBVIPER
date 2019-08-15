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
    
    func viewDidLoad() {
        
    }
    
    func showMovieSelection(with movie: Movie, from view: UIViewController) {
        
    }
    

}

// MARK: - extending MovieListPresenter to implement it's protocol
extension MovieListPresenter: MovieListOutputInteractorProtocol {
    
    func movieListDidFetch(movieList: [Movie]) {
        
    }
}
