//
//  ProductViewController.swift
//  E-clothes
//
//  Created by Владислав on 08.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var productsTableView: UITableView!
    
    //MARK: - Properties
    var products = [Product]()
    
    //MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp = Product(name: "Regular Fit Cotton Shirt", id: "sdfsdf", productDescription: "Short-sleeved shirt in woven cotton fabric with a turn-down collar. Classic button placket, yoke at back, and a chest pocket. Rounded hem. Regular Fit – classic fit with good room for movement and gently shaped waist for a comfortable, tailored silhouette", price: 1400.0, stock: 100, imageURL: "https://images.unsplash.com/photo-1555363947-34f8ceb62946?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", timestamp: Timestamp(), category: "Shirt")
        
        products.append(temp)
        
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: Identifiers.productCell)
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = productsTableView.dequeueReusableCell(withIdentifier: Identifiers.productCell, for: indexPath) as? ProductTableViewCell{
            cell.configureCell(product: products[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
}
