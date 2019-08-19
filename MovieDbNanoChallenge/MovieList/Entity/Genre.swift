//
//  Genre.swift
//  MovieDbNanoChallenge
//
//  Created by Marcus Vinicius Vieira Badiale on 15/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//


import UIKit

/// MovieList Module Entity
struct Genre: Codable{
    var id: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
}
