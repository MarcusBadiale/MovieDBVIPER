//
//  MovieListView.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module View
class MovieListView: UIViewController, MovieListViewProtocol {

    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var loadingTableViewIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchMovieCollection: UICollectionView!
    
    var presenter: MovieListPresenterProtocol?
    var nowPlayingMovieList: [Movie]?
    var popularMovieList: [Movie]?
    var filteredSearchMovies: [Movie]?
    var isSearching = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        MovieListRouter.createMovieListModule(movieListRef: self)
        presenter?.viewDidLoad()
        
        //Tableview config
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        //
        movieListTableView.isHidden = true
        searchMovieCollection.isHidden = true
        //SearchCollection config
        searchMovieCollection.delegate = self
        searchMovieCollection.dataSource = self
    }
    
    //MARK: - Auxiliar functions
    
    func showNowPlayingMovies(with movies: [Movie]) {
        nowPlayingMovieList = movies
        //reload collection
        DispatchQueue.main.async {
            self.movieListTableView.reloadSections(IndexSet(arrayLiteral: 0), with: UITableView.RowAnimation.top)
        }
    }
    
    func showPopularMovies(with movies: [Movie]) {
        popularMovieList = movies
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
            self.loadingTableViewIndicator.isHidden = true
            self.movieListTableView.isHidden = false
        }
    }
    
    func showSearchMovies(with movies: [Movie]) {
        filteredSearchMovies?.removeAll()
        filteredSearchMovies = movies
        DispatchQueue.main.async {
            self.searchMovieCollection.reloadData()
            self.loadingTableViewIndicator.isHidden = true
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
//        searchMovies =
    }
    
    @IBAction func seeAllButtonAction(_ sender: UIButton) {
        presenter?.router?.pushToNowPlaying(with: nowPlayingMovieList!, from: self)
    }
}


//MARK: - Extensions

//SearchBar extension
extension MovieListView: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text?.count ?? 0 >= 3{
            presenter?.sendSearchText(with: searchController.searchBar.text ?? "")
            loadingTableViewIndicator.isHidden = false
        }
    }
}

extension MovieListView: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        movieListTableView.isHidden = true
        searchMovieCollection.isHidden = false
        searchMovieCollection.reloadData()
        
        isSearching = true
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieListTableView.isHidden = false
        searchMovieCollection.isHidden = true
        loadingTableViewIndicator.isHidden = true
        
        isSearching = false
    }
}


//Viper module extension
extension MovieListView: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.pushToMovieDetail(with: popularMovieList![indexPath.row], from: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return popularMovieList?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = movieListTableView.dequeueReusableCell(withIdentifier: "nowPlaying", for: indexPath) as! MovieListNowPlayingTableViewCell
            
            cell.nowPlayingCollectionView.dataSource = self
            cell.nowPlayingCollectionView.delegate = self
            cell.selectionStyle = .none
            
            return cell
        }else{
            let cell = movieListTableView.dequeueReusableCell(withIdentifier: "popularMovies", for: indexPath) as! PopularMoviesTableViewCell
            
            let movie = popularMovieList![indexPath.row]
            
            cell.movieTitle.text = movie.title
            cell.movieRating.text = "\(movie.rating!)"
            cell.movieDescription.text = movie.overview
            
            DispatchQueue.global(qos: .background).async {
                if let url = movie.imageURL, let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        cell.movieImage.image = image
                    }
                }
            }
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
}

extension MovieListView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching{
            return filteredSearchMovies?.count ?? 0
        }else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.router?.pushToMovieDetail(with: nowPlayingMovieList![indexPath.row], from: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCollectionCell", for: indexPath) as! NowPlayingCollectionViewCell
        
        let movie = isSearching ? filteredSearchMovies?[indexPath.row] : nowPlayingMovieList?[indexPath.row]
            
        cell.movieTitle.text = movie?.title
        cell.movieRating.text = "\(movie?.rating! ?? 10.0)"
        
        DispatchQueue.global(qos: .background).async {
            if let url = movie?.imageURL, let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    cell.movieImage.image = image
                }
            }
        }
        return cell
    }
}

