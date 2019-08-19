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
    
    var presenter: MovieListPresenterProtocol?
    var nowPlayingMovieList: [Movie]?
    var popularMovieList: [Movie]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieListRouter.createMovieListModule(movieListRef: self)
        presenter?.viewDidLoad()
        
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        
    }
    
    func showNowPlayingMovies(with movies: [Movie]) {
        nowPlayingMovieList = movies
        //reload collection
    }
    
    func showPopularMovies(with movies: [Movie]) {
        popularMovieList = movies
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
    
}
    
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
        
        if indexPath.section == 0{
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.router?.pushToMovieDetail(with: nowPlayingMovieList![indexPath.row], from: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCollectionCell", for: indexPath) as! NowPlayingCollectionViewCell
        
        let movie = nowPlayingMovieList?[indexPath.row]
            
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

