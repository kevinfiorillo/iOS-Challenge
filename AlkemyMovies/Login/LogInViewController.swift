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
        
        if let userEmail = userTextField.text, !userEmail.isEmpty{
            validateUserEmail(userEmail) ? presentTabBarController() : showAlert(because: ValidationError.email)
        }else{
            showAlert(because: ValidationError.empty)
        }
    }

    private func validateUserEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    private func showAlert(because: ValidationError){
        var messageError = ""
        
        switch because {
            case .email:
                messageError = "email incorrecto"
            case .empty:
                messageError = "campo vacio"
//            default:
//                messageError = "error al ingresar usuario"
        }
        let alert = UIAlertController(title: messageError, message: "Por favor intentelo nuevamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
        
    private func presentTabBarController() {
        let tabBarController = TabBarViewController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }
    
    private enum ValidationError {
        case email, empty
    }
    

}
