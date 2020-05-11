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
    var category: Category?
    
    //MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


//MARK: - Functions

private func fetchProducts(){
    let data = Firestore.firestore().collection("products").whereField("category", isEqualTo: category?.id).order(by: "timestamp", descending: true)
    data.getDocuments { (querySnap, error) in
            guard let response = querySnap else {return}
            for item in response.documents{
                let oneProduct = Product(data: item.data())
                self.products.append(oneProduct)
                self.productsTableView.reloadData()
            }
        }
    }
    private func setupTableView(){
        fetchProducts()
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: Identifiers.productCell)
    }
    
}

//MARK: - Extensions
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.item]
        let productDetailVC =  ProductDetailViewController()
        
        productDetailVC.selectedProduct = selectedProduct
        
        present(productDetailVC, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
}
