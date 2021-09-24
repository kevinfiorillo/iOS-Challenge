//
//  MoviesTableViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 23/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

struct MoviesData: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String?
}

class MoviesTableViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    let api = APIService.shared
    
    var movies: [Movie] = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        
        fetchMovies()
        
        self.moviesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        getCategories()
        
    }
    
    private func getCategories(){
           self.moviesTableView.reloadData()
       }

    private func fetchMovies() {
        api.getPopularMovies{
            data in
            self.movies = data
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
            self.moviesTableView.reloadData()
        }
    }


}

extension  MoviesTableViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.movies[indexPath.row].title
        
        return cell
    }
    
    
}
