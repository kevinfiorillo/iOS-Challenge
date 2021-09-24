//
//  MoviesTableViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 23/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit
import Alamofire

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

class MoviesTableViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    let api = APIService.shared
    
    var movies: [Movie] = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
      
        cell.movieTitle?.text = movie.title

        
        cell.movieImage?.image = buildImage(to: movie)

        return cell
    }
    
    private func buildImage(to movie: Movie) -> UIImage{
        if let urlPost = movie.poster_vertical {
            let urlString = "https://image.tmdb.org/t/p/w200\(urlPost)"
            let fullURL = URL(string: urlString)!
            if let data = try? Data(contentsOf: fullURL) {
                return UIImage(data: data) ?? UIImage()
            }
           
        }
        return UIImage()
    }
    
    
}
