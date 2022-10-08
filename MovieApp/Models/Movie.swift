//
//  Movie.swift
//  MovieApp
//
//  Created by Клоун on 07.10.2022.
//

import Foundation

struct Movie: Codable {
    let production_companies: [Production]
}

struct Production: Codable {
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String
}
