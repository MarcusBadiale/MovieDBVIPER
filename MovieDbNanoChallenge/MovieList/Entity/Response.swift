//
//  Response.swift
//  MovieDbNanoChallenge
//
//  Created by Marcus Vinicius Vieira Badiale on 16/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import Foundation

struct Response: Codable{
    
    var response: [Movie]?
    var genres: [Genre]?
    
    private enum CodingKeys: String, CodingKey{
        case response = "results"
        case genres
    }
}
