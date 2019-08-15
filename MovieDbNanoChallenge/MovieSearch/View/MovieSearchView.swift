//
//  MovieSearchView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieSearch Module View
class MovieSearchView: UIViewController {
    
    private var presenter: MovieSearchPresenterProtocol!
    
    private var object : MovieSearchEntity?
    
    override func loadView() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieSearchPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieSearchView to implement it's protocol
extension MovieSearchView: MovieSearchViewProtocol {
    func set(object: MovieSearchEntity) {
        
    }
    
    
}
