//
//  Model.swift
//  AlkemyMovies
//
//  Created by kevin on 24/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation


struct MoviesData: Codable {
    let results: [Movie]
    
}

struct Movie: Codable {
    let title: String?
    let poster_vertical: String?
    let year: String?
    let rate: Double?
    let poster_horizontal: String?
    let overview: String?

    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case poster_vertical = "poster_path"
        case poster_horizontal = "backdrop_path"
    }

}
