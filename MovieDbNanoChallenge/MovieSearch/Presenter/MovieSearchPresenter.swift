//
//  MovieSearchPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieSearch Module Presenter
class MovieSearchPresenter {
    
    weak private var _view: MovieSearchViewProtocol?
    private var interactor: MovieSearchInteractorProtocol
    private var wireframe: MovieSearchRouterProtocol
    
    init(view: MovieSearchViewProtocol) {
        self._view = view
        self.interactor = MovieSearchInteractor()
        self.wireframe = MovieSearchRouter()
    }
}

// MARK: - extending MovieSearchPresenter to implement it's protocol
extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    
}
