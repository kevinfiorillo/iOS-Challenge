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
    
    var movie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailTitle.text = movie?.title
        detailYear.text = movie?.year
        detailRate.text = getRate()
        detailOverview.text = movie?.overview
        detailPoster.image = buildImage()

      
    }

    private func buildImage() -> UIImage{
        if let urlPost = movie!.poster_horizontal {
            let urlString = "https://image.tmdb.org/t/p/w300\(urlPost)"
            let fullURL = URL(string: urlString)!
            if let data = try? Data(contentsOf: fullURL) {
                return UIImage(data: data) ?? UIImage()
            }
           
        }
        return UIImage()
    }
    
    private func getRate() -> String{
        var finalRate = ""
        let rateInt = Int(round(movie!.rate!))
        for _ in 1...rateInt {
            finalRate += "⭐️"
        }
        return "\(movie!.rate!) \(finalRate)"
    }
    

}
