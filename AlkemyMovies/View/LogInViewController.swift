//
//  LogInViewController.swift
//  AlkemyMovies
//
//  Created by kevin on 23/09/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func joinInTapped(_ sender: UIButton) {
        //falta verificacion de email. solo se comprueba que el usuario haya ingresado texto
          if userTextField.hasText{
                presentTabBarController()
            }else{
            //agregar pantalla de alerta
                print("porfavor ingrese un nombre de usuario")
            }
        }
        
        
        private func presentTabBarController() {
            let tabBarController = TabBarViewController()
            tabBarController.modalPresentationStyle = .overFullScreen
            self.present(tabBarController, animated: true)
    }

}
