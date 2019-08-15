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
    
    
    @IBOutlet weak var movieListTableView: UITableView!
    
     var presenter: MovieListPresenterProtocol!
     var object : Movie?
    
    override func loadView() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        
        
        presenter = MovieListPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieListView to implement it's protocol
extension MovieListView: MovieListViewProtocol {
    func set(object: Movie) {
        
    }
}
    
extension MovieListView: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "nowPlaying", for: indexPath)
        
        
        return cell
    }
    
    
}
    
    


