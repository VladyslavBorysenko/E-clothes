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
    @IBOutlet weak var productImageView: RoundedImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    //MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - IBActions
    @IBAction func deleteFromCartButtonPressed(_ sender: UIButton) {
    }
    
}
