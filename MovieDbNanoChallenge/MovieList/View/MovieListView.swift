//
//  MovieListView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module View
class MovieListView: UIViewController {
    
    private let ui = MovieListViewUI()
    private var presenter: MovieListPresenterProtocol!
    
    private var object : MovieListEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieListPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieListView to implement it's protocol
extension MovieListView: MovieListViewProtocol {
    func set(object: MovieListEntity) {
        
    }
    
    
}

// MARK: - extending MovieListView to implement the custom ui view delegate
extension MovieListView: MovieListViewUIDelegate {
    
}

// MARK: - extending MovieListView to implement the custom ui view data source
extension MovieListView: MovieListViewUIDataSource {
    func objectFor(ui: MovieListViewUI) -> MovieListEntity {
        
    }
    
    // Pass the pre-defined object to the dataSource.
}
