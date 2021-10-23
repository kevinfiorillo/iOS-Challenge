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
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    let api = APIService.shared
    
    var movies: [Movie] = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.backgroundColor = .black
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        
        prepareActivity()
        fetchMovies()
        
        self.moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
    }
    
    private func prepareActivity(){
        activity.color = .orange
    
        activity.isHidden = false
        activity.startAnimating()
    }
    
    private func disapearActivity(){
        activity.stopAnimating()
        activity.isHidden = true
    }

    private func fetchMovies() {
        
        api.getPopularMovies{
            data in
            self.movies = data
            
            self.disapearActivity()
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
        //self.present(nextVC, animated: true, completion: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
}
