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
    
    let popularURL = "https://api.themoviedb.org/3/movie/popular?api_key=e5aa5bb7813d738dff2e193ccdc2ea67"
    
    
//    func getMovieDetails(movieId: Int, comp : @escaping (FeaturesMovie)->()) {
//
//        let request = AF.request(
//            "https://api.themoviedb.org/3/movie/" + String(movieId) + "?api_key=c77900d7c08d5ae239e205a41d88c2cd&language=en-US",
//            method: HTTPMethod.get
//        )
//        request.responseJSON{ (data) in
//            do {
//                let movie = try JSONDecoder().decode(FeaturesMovie.self, from: data.data!)
//
//                print(movie.genres)
//                comp(movie)
//            } catch {
//                print(error)
//            }
//        }
//    }

    func getPopularMovies(comp : @escaping ([Movie])->()) {
        
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
}
