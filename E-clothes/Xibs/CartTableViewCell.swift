//
//  CartTableViewCell.swift
//  E-clothes
//
//  Created by Владислав on 11.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    //MARK: - IBoutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var testView: RoundedView!
    
    
    
    //MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Functions
    func setupProductCell(item: Product){
        productNameLabel.text = item.name
        
        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        if let price = priceFormatter.string(from: item.price as NSNumber){
          productPriceLabel.text = price
        }
        
        if let url = URL(string: item.imageURL){
           productImageView.kf.setImage(with: url)
        }
        print(testView.frame.width)
    }
    
    
    //MARK: - IBActions
    @IBAction func deleteFromCartButtonPressed(_ sender: UIButton) {
        //Cart.shared.removeFromCart(itemIndex: <#T##Int#>)
    }
    
}
