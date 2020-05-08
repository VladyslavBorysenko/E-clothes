//
//  LoginViewController.swift
//  E-clothes
//
//  Created by Владислав on 19.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    //MARK: - IBoutlets

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - ViewControllerLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - IBActions
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let email = emailTextField.text, email.isNotEmpty else {return}
        guard let password = passwordTextField.text, password.isNotEmpty else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error{
                debugPrint(error)
            }
            else {
                self.dismiss(animated: true, completion: nil)
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func continueAsGuestButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    
    
}
