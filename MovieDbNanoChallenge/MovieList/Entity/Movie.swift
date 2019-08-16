//
//  MovieListEntity.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

/// MovieList Module Entity
struct Movie: Codable {
    
    var title: String?
    var rating: Double?
    var description: String?
    var posterPath: String?
    var id: Int?
//    var genres: [Genre]
    var imageURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, id
        case rating = "vote_average"
        case posterPath = "poster_path"
        case description = "overview"
    }
    
}
