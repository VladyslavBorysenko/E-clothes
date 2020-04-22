//
//  ViewController.swift
//  E-clothes
//
//  Created by Владислав on 01.04.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    // MARK: -  ViewControllerLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        launchLoginViewController()
    }
    

    //MARK: - PrivateFunctions
    private func launchLoginViewController(){
        let launchStoryboard = UIStoryboard(name: StoryboardName.loginStoryboard, bundle: nil)
        let loginViewController = launchStoryboard.instantiateViewController(withIdentifier: StoryboardID.loginNavigationID)
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
        
    }

}

