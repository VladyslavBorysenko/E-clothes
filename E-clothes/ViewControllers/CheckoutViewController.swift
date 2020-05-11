//
//  CheckoutViewController.swift
//  E-clothes
//
//  Created by Владислав on 11.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    
    //MARK: -  IBOutlets
    
    @IBOutlet weak var orderValueLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalOrderValueLabel: UILabel!
    @IBOutlet weak var orderedProductsList: UITableView!
    
    //MARK: - ViewControllerLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - IBActions
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
    }
    
}
