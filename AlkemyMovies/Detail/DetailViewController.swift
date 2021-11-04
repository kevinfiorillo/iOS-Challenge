//
//  DetailViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 24/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailPoster: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailYear: UILabel!
    
    @IBOutlet weak var detailRate: UILabel!
    
    @IBOutlet weak var detailOverview: UILabel!
    
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vm = viewModel {
            detailTitle.text = vm.movie.title
            detailYear.text = vm.movie.year
            detailRate.text = getRate(to: vm.movie)
            detailOverview.text = vm.movie.overview
            detailPoster.image = buildImage(to: vm.movie)
        }
        

      
    }

    private func buildImage(to movie: Movie) -> UIImage{
        if let urlPost = movie.poster_horizontal {
            let urlString = "https://image.tmdb.org/t/p/w300\(urlPost)"
            let fullURL = URL(string: urlString)!
            if let data = try? Data(contentsOf: fullURL) {
                return UIImage(data: data) ?? UIImage()
            }
           
        }
        return UIImage()
    }
    
    private func getRate(to movie: Movie) -> String{
        var finalRate = ""
        let rateInt = Int(round(movie.rate!))
        for _ in 1...rateInt {
            finalRate += "⭐️"
        }
        return "\(movie.rate!) \(finalRate)"
    }
    

}
