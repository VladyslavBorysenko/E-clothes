//
//  ProductTableViewCell.swift
//  E-clothes
//
//  Created by Владислав on 08.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var productImage: RoundedImageView!
    @IBOutlet weak var productNameTextField: UILabel!
    @IBOutlet weak var productPriceTextField: UILabel!
    @IBOutlet weak var addToFavButton: UIButton!
    
    
    //MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Functions
    func configureCell(product: Product){
        if let url = URL(string: product.imageURL){
            productImage.kf.setImage(with: url)
        }
        productNameTextField.text = product.name
        productPriceTextField.text = String(product.price)
    }
    
    //MARK: -IBActions
    @IBAction func addToCartButtonPressed(_ sender: RoundedButton) {
    }
    @IBAction func addToFavButtonPressed(_ sender: Any) {
    }
    
    
}
