//
//  MovieDetailPresenter.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module Presenter
class MovieDetailPresenter {
    
    weak private var _view: MovieDetailViewProtocol?
    private var interactor: MovieDetailInteractorProtocol
    private var wireframe: MovieDetailRouterProtocol
    
    init(view: MovieDetailViewProtocol) {
        self._view = view
        self.interactor = MovieDetailInteractor()
        self.wireframe = MovieDetailRouter()
    }
}

// MARK: - extending MovieDetailPresenter to implement it's protocol
extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func fetch(objectFor view: MovieDetailViewProtocol) {
        
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: MovieDetailEntity) {
        
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error) {
        
    }
    
    
}
