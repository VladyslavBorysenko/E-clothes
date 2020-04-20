//
//  LoginViewController.swift
//  E-clothes
//
//  Created by Владислав on 19.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func createNewUserButtonPressed(_ sender: UIButton) {
    }
    
    
    
    
}
