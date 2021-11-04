//
//  APIService.swift
//  AlkemyMovies
//
//  Created by kevin on 24/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation
import Alamofire

final class APIService {
    
    static let shared = APIService()
    
    let movieUrlPath = Constants.movieURLPath
    let imageURL = Constants.imageURL
    let apiKey = Constants.apiKey



    func getPopularMovies(comp : @escaping ([Movie])->()) {
        
        let popularURL = "\(movieUrlPath)popular?\(apiKey)"
        let request = AF.request(popularURL,method: HTTPMethod.get)
        
        request.responseJSON{ (data) in
            do {
                let movies = try JSONDecoder().decode(MoviesData.self, from: data.data!)
                comp(movies.results)
            } catch {
                print(error)
            }
        }
    }
    
//    func getRandomMovie(comp : @escaping (Movie)->()) {
//
//    }
    
    
}
