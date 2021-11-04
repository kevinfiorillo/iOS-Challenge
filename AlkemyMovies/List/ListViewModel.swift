//
//  ListViewModel.swift
//  AlkemyMovies
//
//  Created by kevin on 04/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation

class ListViewModel {
    private let moviesService: APIService
    
    var refreshData = { () -> () in}
    
    var movies: [Movie] = [] {
        didSet {
            refreshData()
        }
    }
    
    init(service: APIService) {
        self.moviesService = service
    }
    
    func getMovies(completion: @escaping () -> Void) {
        moviesService.getPopularMovies{
            data in
            self.movies = data
            completion()
        }
    }
}
