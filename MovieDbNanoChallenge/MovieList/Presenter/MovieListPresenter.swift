//
//  MovieListPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module Presenter
class MovieListPresenter {
    
    weak private var _view: MovieListViewProtocol?
    private var interactor: MovieListInteractorProtocol
    private var wireframe: MovieListRouterProtocol
    
    init(view: MovieListViewProtocol) {
        self._view = view
        self.interactor = MovieListInteractor()
        self.wireframe = MovieListRouter()
    }
}

// MARK: - extending MovieListPresenter to implement it's protocol
extension MovieListPresenter: MovieListPresenterProtocol {
    
}
