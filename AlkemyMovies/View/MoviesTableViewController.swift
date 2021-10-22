//
//  MoviesTableViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 23/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit
import Alamofire



class MoviesTableViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    let api = APIService.shared
    
    var movies: [Movie] = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.backgroundColor = .black
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        
        fetchMovies()
        
        //self.moviesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        let movie = self.movies[indexPath.row]
        
      
        cell.fillCell(with: movie)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexCell = indexPath.row
        let movieSelected = self.movies[indexCell]
        let nextVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        nextVC.movie = movieSelected
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
}
