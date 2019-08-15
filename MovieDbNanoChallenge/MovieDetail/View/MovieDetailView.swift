//
//  MovieDetailView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieDetail Module View
class MovieDetailView: UIViewController {
    
    private var presenter: MovieDetailPresenterProtocol!
    
    private var object : MovieDetailEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieDetailPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieDetailView to implement it's protocol
extension MovieDetailView: MovieDetailViewProtocol {
    func set(object: MovieDetailEntity) {
        
    }
    
    
}


