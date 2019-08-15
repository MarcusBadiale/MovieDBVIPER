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
    
    private let ui = MovieSearchViewUI()
    private var presenter: MovieSearchPresenterProtocol!
    
    private var object : MovieSearchEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
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

// MARK: - extending MovieSearchView to implement the custom ui view delegate
extension MovieSearchView: MovieSearchViewUIDelegate {
    
}

// MARK: - extending MovieSearchView to implement the custom ui view data source
extension MovieSearchView: MovieSearchViewUIDataSource {
    func objectFor(ui: MovieSearchViewUI) -> MovieSearchEntity {
        
    }
    
    // Pass the pre-defined object to the dataSource.
}
