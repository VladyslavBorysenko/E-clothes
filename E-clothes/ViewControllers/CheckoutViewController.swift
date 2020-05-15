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
        setupTableView()
        setupPaymentInfo()
        // Do any additional setup after loading the view.
    }
    
    //MARK: -  Functions
    
    func setupTableView() {
        orderedProductsList.delegate = self
        orderedProductsList.dataSource = self
        orderedProductsList.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: Identifiers.CartCell)
    }
    
    func setupPaymentInfo(){
        orderValueLabel.text = String(Cart.shared.subtotal)
        shippingLabel.text = String(Cart.shared.shippingFee)
        totalOrderValueLabel.text = String(Cart.shared.total)
    }

    //MARK: - IBActions
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
    }
    
}

//MARK: - Extentions

extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = orderedProductsList.dequeueReusableCell(withIdentifier: Identifiers.CartCell, for: indexPath) as? CartTableViewCell{
        
            cell.setupProductCell(item: Cart.shared.cartItems[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
