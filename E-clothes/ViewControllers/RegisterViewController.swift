//
//  RegisterViewController.swift
//  E-clothes
//
//  Created by Владислав on 19.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //MARK: - IBoutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var checkMarkPasswordFirst: UIImageView!
    @IBOutlet weak var checkMarkPasswordSecond: UIImageView!
    
    
//MARK: - ViewControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldValueChanged(_: UITextField ){
        
        if let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            if password.isEmpty && confirmPassword.isEmpty {
                checkMarkPasswordFirst.isHidden = true
                checkMarkPasswordSecond.isHidden = true
            }
            else {
                checkMarkPasswordFirst.isHidden = false
                checkMarkPasswordSecond.isHidden = false
            }
            
            if password == confirmPassword{
                checkMarkPasswordFirst.image = UIImage(named: AppImage.greenCheckMark)
                checkMarkPasswordSecond.image = UIImage(named: AppImage.greenCheckMark)
            } else {
                checkMarkPasswordFirst.image = UIImage(named: AppImage.redCheckMark)
                checkMarkPasswordSecond.image = UIImage(named: AppImage.redCheckMark)
            }
        }
        
    }
    
//MARK: - IBActions
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        activityIndicator.startAnimating()
        guard let email = emailTextField.text, email.isNotEmpty else {return}
        guard let password = passwordTextField.text, password.isNotEmpty, let confirmPassword = confirmPasswordTextField.text, confirmPassword.isNotEmpty else {return}
        guard let username = usernameTextField.text, username.isNotEmpty else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error{
                debugPrint(error)
                return
            } else {
                self.dismiss(animated: true, completion: nil)
            }
            self.activityIndicator.stopAnimating()
        }

    }
}
