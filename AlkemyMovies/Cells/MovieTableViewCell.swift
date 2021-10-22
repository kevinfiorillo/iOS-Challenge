//
//  MovieTableViewCell.swift
//  AlkemyMovies
//
//  Created by kevin on 24/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(with movie: Movie){
        
        movieTitle?.text = movie.title
        
        if let urlPost = movie.poster_vertical {
            let urlString = "https://image.tmdb.org/t/p/w200\(urlPost)"
             guard let fullImageURL = URL(string: urlString) else {return}
            if let data = try? Data(contentsOf: fullImageURL) {
                movieImage?.image = UIImage(data: data) ?? UIImage()
            }
            
            
           
        }
        
    }
 
    
}
