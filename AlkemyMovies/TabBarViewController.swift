//
//  TabBarViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 23/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewControllers()
    }
    
    private func buildViewControllers(){
        let listMoviesViewController = UINavigationController(rootViewController: MoviesTableViewController(nibName: "MoviesTableViewController", bundle: nil))
        listMoviesViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        let randomMovieViewController = UINavigationController(rootViewController: RandomMovieViewController(nibName: "RandomMovieViewController", bundle: nil))
        randomMovieViewController.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "shuffle"), selectedImage: nil)
        viewControllers = [listMoviesViewController, randomMovieViewController]
    }

}
