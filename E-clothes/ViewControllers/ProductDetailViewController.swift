//
//  ProductDetailViewController.swift
//  E-clothes
//
//  Created by Владислав on 09.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameTextField: UILabel!
    @IBOutlet weak var productDescriptionTextField: UILabel!
    @IBOutlet weak var productPriceTextField: UILabel!
    
    //MARK: - Properties

    var selectedProduct: Product!
    
    //MARK: - Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSelectedProduct()
        // Do any additional setup after loading the view.
    }
//MARK: - Functions
    
    func setupSelectedProduct(){
        productNameTextField.text = selectedProduct.name
        productDescriptionTextField.text = selectedProduct.productDescription
        
        if let url = URL(string: selectedProduct.imageURL){
            productImageView.kf.setImage(with: url)
        }
        
        let productPrice = NumberFormatter()
        productPrice.numberStyle = .currency
        if let price = productPrice.string(from: selectedProduct.price as NSNumber ){
            productPriceTextField.text = price
        }
    }
    
//MARK: - IBActions
    
    @IBAction func addToCartButtonPressed(_ sender: RoundedButton) {
        Cart.shared.addToCart(item: selectedProduct)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func continueShoppingButtonPressed(_ sender: RoundedButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
