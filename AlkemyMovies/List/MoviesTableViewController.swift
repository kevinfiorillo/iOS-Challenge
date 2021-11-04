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

    private var viewModel: ListViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ListViewModel(service: APIService.shared)
        
        moviesTableView.backgroundColor = .black
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        
        prepareActivity()
        bind()
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
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
                self?.disapearActivity()
            }
        }
    }

    private func fetchMovies() {
        
        viewModel.getMovies{
            self.disapearActivity()
            self.moviesTableView.reloadData()
        }
        
    }


}

extension  MoviesTableViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.movies[indexPath.row]
        
      
        cell.fillCell(with: movie)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexCell = indexPath.row
        let selectedMovie = viewModel.movies[indexCell]
        let nextVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        nextVC.viewModel = DetailViewModel(movie: selectedMovie)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
}
