//
//  Networking.swift
//  MovieDbNanoChallenge
//
//  Created by Marcus Vinicius Vieira Badiale on 16/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import Foundation


class Request {
    
    typealias CompletionHandler = ( _ data: [Movie]?, _ error: Error?) -> Void
    
    func fetchNowPlayingMovies(completionHandler: @escaping CompletionHandler) {
    
        var movies: [Movie] = []
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=4c86680eeadb3c625a7f347b2ce6e135&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data)
                movies = response.response!
                completionHandler(movies, nil)
                
            } catch let error{
                print("Error", error)
            }
        }.resume()
    }
    
    func fetchPopularMovies(completionHandler: @escaping CompletionHandler) {
        
        var movies: [Movie] = []
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4c86680eeadb3c625a7f347b2ce6e135&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                movies = response.response!
                completionHandler(movies, nil)
                
            } catch let error{
                print("Error", error)
            }
            }.resume()
        
    }
    
//    func fetchSearchResult() -> [Movie] {
//        
//    }
    
}
